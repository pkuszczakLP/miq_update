class ManageIQ::Providers::Awx::Inventory::Collector::AutomationManager < ManageIQ::Providers::Inventory::Collector
  def connection
    @connection ||= manager.connect
  end

  def inventories
    connection.api.inventories.all
  end

  def hosts
    connection.api.hosts.all
  end

  def job_templates
    connection.api.job_templates.all
  end

  def configuration_workflows
    connection.api.workflow_job_templates.all
  end

  def projects
    connection.api.projects.all
  end

  def credentials
    connection.api.credentials.all
  end
end
