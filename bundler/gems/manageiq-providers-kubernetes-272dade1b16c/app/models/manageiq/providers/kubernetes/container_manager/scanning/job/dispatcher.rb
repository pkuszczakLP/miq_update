class ManageIQ::Providers::Kubernetes::ContainerManager::Scanning::Job::Dispatcher < ::Job::Dispatcher
  def initialize
    @active_container_scans_by_zone_and_ems = nil
  end

  def dispatch
    _, total_time = Benchmark.realtime_block(:total_time) do
      Benchmark.realtime_block(:container_dispatching) { dispatch_container_scan_jobs }
    end

    _log.info("Complete - Timings: #{total_time.inspect}")
  end

  def dispatch_container_scan_jobs
    jobs_by_ems, = Benchmark.realtime_block(:pending_container_jobs) { pending_container_jobs }
    Benchmark.current_realtime[:container_jobs_to_dispatch_count] = jobs_by_ems.values.reduce(0) { |m, o| m + o.length }
    jobs_by_ems.each do |ems_id, jobs|
      dispatch_to_ems(ems_id, jobs, Settings.container_scanning.concurrent_per_ems.to_i)
    end
  end

  def dispatch_to_ems(ems_id, jobs, concurrent_ems_limit)
    jobs.each do |job|
      active_ems_scans = active_container_scans_by_zone_and_ems[zone_name][ems_id]
      if concurrent_ems_limit > 0 && active_ems_scans >= concurrent_ems_limit
        _log.warn(
          "SKIPPING remaining Container Image scan jobs for Provider [%s] in dispatch since there are [%d] active scans in zone [%s]" %
            [
              ems_id,
              active_ems_scans,
              zone_name
            ]
        )
        break
      end
      do_dispatch(job, ems_id)
    end
  end

  def do_dispatch(job, ems_id)
    _log.info("Signaling start for container image scan job [#{job.id}]")
    job.update(:dispatch_status => "active", :started_on => Time.now.utc)
    @active_container_scans_by_zone_and_ems[zone_name][ems_id] += 1
    MiqQueue.put_unless_exists(
      :args        => [:start],
      :class_name  => "Job",
      :instance_id => job.id,
      :method_name => "signal",
      :priority    => MiqQueue::HIGH_PRIORITY,
      :role        => "smartstate",
      :task_id     => job.guid,
      :zone        => job.zone
    )
  end

  def pending_container_jobs
    pending_jobs.each_with_object(Hash.new { |h, k| h[k] = [] }) do |job, h|
      h[job.options[:ems_id]] << job
    end
  end

  def active_scans_by_zone(count = true)
    actives = Hash.new(0)
    jobs = job_class.where(:zone => zone_name, :dispatch_status => "active")
              .where.not(:state => "finished")
    actives[zone_name] = count ? jobs.count : jobs
    actives
  end

  def active_container_scans_by_zone_and_ems
    @active_container_scans_by_zone_and_ems ||= begin
      memo = Hash.new do |h, k|
        h[k] = Hash.new(0)
      end
      active_scans_by_zone(false)[zone_name].each do |job|
        memo[zone_name][job.options[:ems_id]] += 1
      end
      memo
    end
  end
end
