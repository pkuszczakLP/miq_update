class ApplicationHelper::Button::UtilizationDownload < ApplicationHelper::Button::Basic
  def visible?
    @sb[:active_tab] == 'report'
  end

  def disabled?
    # to enable the button we are in the "Utilization" and have trend report
    return false if @layout == 'miq_capacity_utilization' && @sb[:active_tab] == 'report' && !@sb.fetch_path(:trend_rpt)&.table&.data&.empty? && @sb[:summary].present?

    # otherwise the button is off
    @error_message = _('No records found for this report')
    @error_message.present?
  end
end
