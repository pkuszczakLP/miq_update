class TreeBuilderStorage < TreeBuilder
  include TreeBuilderFiltersMixin

  private

  def tree_init_options
    {:lazy => true, :allow_reselect => true}
  end

  def root_options
    {
      :text    => t = _("All Datastores"),
      :tooltip => t
    }
  end

  def x_get_tree_roots
    count_only_or_objects(false, FILTERS.values)
  end

  def x_get_tree_custom_kids(object, count_only)
    count_only_or_filter_kids("Storage", object, count_only)
  end
end
