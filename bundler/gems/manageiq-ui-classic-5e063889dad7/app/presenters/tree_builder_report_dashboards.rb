class TreeBuilderReportDashboards < TreeBuilder
  has_kids_for MiqGroup, [:x_get_tree_g_kids]

  private

  def tree_init_options
    {:full_ids => true, :lazy => true}
  end

  def root_options
    {
      :text    => t = _("All Dashboards"),
      :tooltip => t
    }
  end

  # Get root nodes count/array for explorer tree
  def x_get_tree_roots
    [
      MiqWidgetSet.default_dashboard,
      {
        :id => 'g', :text => _('All Groups'), :icon => 'pficon pficon-folder-close', :tip => _('All Groups')
      }
    ]
  end

  def x_get_tree_custom_kids(object, count_only)
    objects = []
    if object[:id].split('-').first == "g"
      objects = Rbac.filtered(MiqGroup.non_tenant_groups)
      return count_only ? objects.count : objects.sort_by(&:name)
    end
    count_only_or_objects(count_only, objects, :name)
  end

  def x_get_tree_g_kids(object, count_only)
    count_only_or_objects(count_only, object.ordered_widget_sets)
  end
end
