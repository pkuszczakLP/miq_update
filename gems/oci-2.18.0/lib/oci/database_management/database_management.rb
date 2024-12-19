# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module DatabaseManagement
    # Module containing models for requests made to, and responses received from,
    # OCI DatabaseManagement services
    module Models
    end
  end
end

# Require models
require 'oci/database_management/models/activity_time_series_metrics'
require 'oci/database_management/models/add_data_files_details'
require 'oci/database_management/models/add_managed_database_to_managed_database_group_details'
require 'oci/database_management/models/addm_task_summary'
require 'oci/database_management/models/addm_tasks_collection'
require 'oci/database_management/models/alert_log_collection'
require 'oci/database_management/models/alert_log_count_summary'
require 'oci/database_management/models/alert_log_counts_collection'
require 'oci/database_management/models/alert_log_summary'
require 'oci/database_management/models/allowed_parameter_value'
require 'oci/database_management/models/asm_property'
require 'oci/database_management/models/asm_property_collection'
require 'oci/database_management/models/asm_property_summary'
require 'oci/database_management/models/associated_database_collection'
require 'oci/database_management/models/associated_database_summary'
require 'oci/database_management/models/attention_log_collection'
require 'oci/database_management/models/attention_log_count_summary'
require 'oci/database_management/models/attention_log_counts_collection'
require 'oci/database_management/models/attention_log_summary'
require 'oci/database_management/models/awr_db_collection'
require 'oci/database_management/models/awr_db_cpu_usage_collection'
require 'oci/database_management/models/awr_db_cpu_usage_summary'
require 'oci/database_management/models/awr_db_metric_collection'
require 'oci/database_management/models/awr_db_metric_summary'
require 'oci/database_management/models/awr_db_parameter_change_collection'
require 'oci/database_management/models/awr_db_parameter_change_summary'
require 'oci/database_management/models/awr_db_parameter_collection'
require 'oci/database_management/models/awr_db_parameter_summary'
require 'oci/database_management/models/awr_db_report'
require 'oci/database_management/models/awr_db_snapshot_collection'
require 'oci/database_management/models/awr_db_snapshot_range_collection'
require 'oci/database_management/models/awr_db_snapshot_range_summary'
require 'oci/database_management/models/awr_db_snapshot_summary'
require 'oci/database_management/models/awr_db_sql_report'
require 'oci/database_management/models/awr_db_summary'
require 'oci/database_management/models/awr_db_sysstat_collection'
require 'oci/database_management/models/awr_db_sysstat_summary'
require 'oci/database_management/models/awr_db_top_wait_event_collection'
require 'oci/database_management/models/awr_db_top_wait_event_summary'
require 'oci/database_management/models/awr_db_wait_event_bucket_collection'
require 'oci/database_management/models/awr_db_wait_event_bucket_summary'
require 'oci/database_management/models/awr_db_wait_event_collection'
require 'oci/database_management/models/awr_db_wait_event_summary'
require 'oci/database_management/models/awr_query_result'
require 'oci/database_management/models/change_database_parameter_details'
require 'oci/database_management/models/change_database_parameters_details'
require 'oci/database_management/models/change_db_management_private_endpoint_compartment_details'
require 'oci/database_management/models/change_job_compartment_details'
require 'oci/database_management/models/change_managed_database_group_compartment_details'
require 'oci/database_management/models/child_database'
require 'oci/database_management/models/clone_sql_tuning_task_details'
require 'oci/database_management/models/cluster_cache_metric'
require 'oci/database_management/models/compare_type'
require 'oci/database_management/models/consumer_group_privilege_collection'
require 'oci/database_management/models/consumer_group_privilege_summary'
require 'oci/database_management/models/cpu_utilization_aggregate_metrics'
require 'oci/database_management/models/create_db_management_private_endpoint_details'
require 'oci/database_management/models/create_job_details'
require 'oci/database_management/models/create_managed_database_group_details'
require 'oci/database_management/models/create_sql_job_details'
require 'oci/database_management/models/create_tablespace_details'
require 'oci/database_management/models/data_access_container_collection'
require 'oci/database_management/models/data_access_container_summary'
require 'oci/database_management/models/database_credentials'
require 'oci/database_management/models/database_fleet_health_metrics'
require 'oci/database_management/models/database_home_metric_definition'
require 'oci/database_management/models/database_home_metrics'
require 'oci/database_management/models/database_io_aggregate_metrics'
require 'oci/database_management/models/database_instance_home_metrics_definition'
require 'oci/database_management/models/database_parameter_summary'
require 'oci/database_management/models/database_parameter_update_status'
require 'oci/database_management/models/database_parameters_collection'
require 'oci/database_management/models/database_status'
require 'oci/database_management/models/database_storage_aggregate_metrics'
require 'oci/database_management/models/database_sub_type'
require 'oci/database_management/models/database_time_aggregate_metrics'
require 'oci/database_management/models/database_type'
require 'oci/database_management/models/database_usage_metrics'
require 'oci/database_management/models/datafile'
require 'oci/database_management/models/db_management_private_endpoint'
require 'oci/database_management/models/db_management_private_endpoint_collection'
require 'oci/database_management/models/db_management_private_endpoint_summary'
require 'oci/database_management/models/deployment_type'
require 'oci/database_management/models/drop_sql_tuning_task_details'
require 'oci/database_management/models/drop_tablespace_details'
require 'oci/database_management/models/execution_plan_stats_comparision'
require 'oci/database_management/models/failed_connections_aggregate_metrics'
require 'oci/database_management/models/fleet_metric_definition'
require 'oci/database_management/models/fleet_metric_summary_definition'
require 'oci/database_management/models/fleet_status_by_category'
require 'oci/database_management/models/fleet_summary'
require 'oci/database_management/models/historic_addm_result'
require 'oci/database_management/models/instance_details'
require 'oci/database_management/models/job'
require 'oci/database_management/models/job_collection'
require 'oci/database_management/models/job_database'
require 'oci/database_management/models/job_execution'
require 'oci/database_management/models/job_execution_collection'
require 'oci/database_management/models/job_execution_result_details'
require 'oci/database_management/models/job_execution_result_location'
require 'oci/database_management/models/job_execution_summary'
require 'oci/database_management/models/job_executions_status_summary'
require 'oci/database_management/models/job_executions_status_summary_collection'
require 'oci/database_management/models/job_run'
require 'oci/database_management/models/job_run_collection'
require 'oci/database_management/models/job_run_summary'
require 'oci/database_management/models/job_schedule_details'
require 'oci/database_management/models/job_summary'
require 'oci/database_management/models/job_types'
require 'oci/database_management/models/lifecycle_states'
require 'oci/database_management/models/managed_database'
require 'oci/database_management/models/managed_database_collection'
require 'oci/database_management/models/managed_database_credential'
require 'oci/database_management/models/managed_database_group'
require 'oci/database_management/models/managed_database_group_collection'
require 'oci/database_management/models/managed_database_group_summary'
require 'oci/database_management/models/managed_database_password_credential'
require 'oci/database_management/models/managed_database_secret_credential'
require 'oci/database_management/models/managed_database_summary'
require 'oci/database_management/models/management_option'
require 'oci/database_management/models/memory_aggregate_metrics'
require 'oci/database_management/models/metric_data_point'
require 'oci/database_management/models/metric_dimension_definition'
require 'oci/database_management/models/metric_statistics_definition'
require 'oci/database_management/models/object_privilege_collection'
require 'oci/database_management/models/object_privilege_summary'
require 'oci/database_management/models/object_storage_job_execution_result_details'
require 'oci/database_management/models/object_storage_job_execution_result_location'
require 'oci/database_management/models/parameter_scope'
require 'oci/database_management/models/parent_group'
require 'oci/database_management/models/pdb_metrics'
require 'oci/database_management/models/pdb_status_details'
require 'oci/database_management/models/proxied_for_user_collection'
require 'oci/database_management/models/proxied_for_user_summary'
require 'oci/database_management/models/proxy_user_collection'
require 'oci/database_management/models/proxy_user_summary'
require 'oci/database_management/models/remove_data_file_details'
require 'oci/database_management/models/remove_managed_database_from_managed_database_group_details'
require 'oci/database_management/models/reset_database_parameters_details'
require 'oci/database_management/models/resize_data_file_details'
require 'oci/database_management/models/role_collection'
require 'oci/database_management/models/role_summary'
require 'oci/database_management/models/run_historic_addm_details'
require 'oci/database_management/models/snapshot_details'
require 'oci/database_management/models/sort_orders'
require 'oci/database_management/models/sql_job'
require 'oci/database_management/models/sql_tuning_advisor_task_collection'
require 'oci/database_management/models/sql_tuning_advisor_task_finding_collection'
require 'oci/database_management/models/sql_tuning_advisor_task_finding_summary'
require 'oci/database_management/models/sql_tuning_advisor_task_recommendation_collection'
require 'oci/database_management/models/sql_tuning_advisor_task_recommendation_summary'
require 'oci/database_management/models/sql_tuning_advisor_task_sql_execution_plan'
require 'oci/database_management/models/sql_tuning_advisor_task_summary'
require 'oci/database_management/models/sql_tuning_advisor_task_summary_finding_benefits'
require 'oci/database_management/models/sql_tuning_advisor_task_summary_finding_counts'
require 'oci/database_management/models/sql_tuning_advisor_task_summary_report'
require 'oci/database_management/models/sql_tuning_advisor_task_summary_report_index_finding_summary'
require 'oci/database_management/models/sql_tuning_advisor_task_summary_report_object_stat_finding_summary'
require 'oci/database_management/models/sql_tuning_advisor_task_summary_report_statement_counts'
require 'oci/database_management/models/sql_tuning_advisor_task_summary_report_statistics'
require 'oci/database_management/models/sql_tuning_advisor_task_summary_report_task_info'
require 'oci/database_management/models/sql_tuning_set_collection'
require 'oci/database_management/models/sql_tuning_set_input'
require 'oci/database_management/models/sql_tuning_set_summary'
require 'oci/database_management/models/sql_tuning_task_credential_details'
require 'oci/database_management/models/sql_tuning_task_credential_types'
require 'oci/database_management/models/sql_tuning_task_password_credential_details'
require 'oci/database_management/models/sql_tuning_task_plan_stats'
require 'oci/database_management/models/sql_tuning_task_return'
require 'oci/database_management/models/sql_tuning_task_secret_credential_details'
require 'oci/database_management/models/sql_tuning_task_sql_detail'
require 'oci/database_management/models/sql_tuning_task_sql_execution_plan_step'
require 'oci/database_management/models/sql_tuning_task_status_types'
require 'oci/database_management/models/start_sql_tuning_task_details'
require 'oci/database_management/models/statements_aggregate_metrics'
require 'oci/database_management/models/system_privilege_collection'
require 'oci/database_management/models/system_privilege_summary'
require 'oci/database_management/models/tablespace'
require 'oci/database_management/models/tablespace_admin_credential_details'
require 'oci/database_management/models/tablespace_admin_password_credential_details'
require 'oci/database_management/models/tablespace_admin_secret_credential_details'
require 'oci/database_management/models/tablespace_admin_status'
require 'oci/database_management/models/tablespace_collection'
require 'oci/database_management/models/tablespace_storage_size'
require 'oci/database_management/models/tablespace_summary'
require 'oci/database_management/models/time_series_metric_data_point'
require 'oci/database_management/models/time_series_metric_definition'
require 'oci/database_management/models/update_database_parameters_result'
require 'oci/database_management/models/update_db_management_private_endpoint_details'
require 'oci/database_management/models/update_job_details'
require 'oci/database_management/models/update_managed_database_group_details'
require 'oci/database_management/models/update_sql_job_details'
require 'oci/database_management/models/update_tablespace_details'
require 'oci/database_management/models/user'
require 'oci/database_management/models/user_collection'
require 'oci/database_management/models/user_summary'
require 'oci/database_management/models/work_request'
require 'oci/database_management/models/work_request_collection'
require 'oci/database_management/models/work_request_error'
require 'oci/database_management/models/work_request_error_collection'
require 'oci/database_management/models/work_request_log_entry'
require 'oci/database_management/models/work_request_log_entry_collection'
require 'oci/database_management/models/work_request_operation_type'
require 'oci/database_management/models/work_request_resource'
require 'oci/database_management/models/work_request_resource_action_type'
require 'oci/database_management/models/work_request_status'
require 'oci/database_management/models/work_request_summary'
require 'oci/database_management/models/workload_type'

# Require generated clients
require 'oci/database_management/db_management_client'
require 'oci/database_management/db_management_client_composite_operations'
require 'oci/database_management/diagnosability_client'
require 'oci/database_management/sql_tuning_client'

# Require service utilities
require 'oci/database_management/util'