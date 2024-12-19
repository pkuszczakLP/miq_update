class ManageIQ::Providers::Amazon::Inventory::Collector::StorageManager::S3 <
  ManageIQ::Providers::Amazon::Inventory::Collector

  def cloud_object_store_containers
    hash_collection.new(aws_s3.client.list_buckets.flat_map(&:buckets))
  end

  def cloud_object_store_objects(options = {})
    options[:token] ||= nil
    # S3 bucket accessible only for API client with same region
    regional_client = aws_s3_regional(options[:region]).client
    response = regional_client.list_objects_v2(
      :bucket             => options[:bucket],
      :continuation_token => options[:token]
    )
    token = response.next_continuation_token if response.is_truncated
    return hash_collection.new(response.contents), token
  rescue => e
    log_header = "MIQ(#{self.class.name}.#{__method__}) Collecting data for EMS name: [#{manager.name}] id: [#{manager.id}]"
    $aws_log.warn("#{log_header}: Unable to collect S3 objects in a bucket #{options[:bucket]}, Message: #{e.message}")
    $aws_log.warn(e.backtrace.join("\n"))
    return [], nil
  end

  private

  def aws_s3_regional(region)
    if !region || region == manager.provider_region
      aws_s3
    else
      @regional_resources ||= {}
      @regional_resources[region] ||= manager.connect(:service => :S3, :region => region)
    end
  end
end
