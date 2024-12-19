module Api
  class TagsController < BaseController
    def create_resource(type, _id, data)
      assert_id_not_specified(data, type)
      category_data = data.delete("category") { {} }
      category = fetch_category(category_data)
      unless category
        category_rep = category_data.map { |k, v| "#{k} = #{v}" }.join(', ')
        raise BadRequestError, "Could not find category with data #{category_rep}"
      end
      begin
        entry = category.add_entry(data)
        raise BadRequestError, entry.errors.full_messages.join(', ') unless entry.valid?
        entry.tag
      rescue => err
        raise BadRequestError, "Could not create a new tag - #{err}"
      end
    end

    def edit_resource(_type, id, data)
      entry = Classification.find_by(:tag_id => id)
      raise BadRequestError, "Failed to find tag/#{id} resource" unless entry
      entry.update(data.except(*ID_ATTRS))
      entry.tag
    end

    # TODO: Fix resource_search to handle a classification id or tag id
    #       Then delete this method
    def delete_resource_action(type, id, data = {})
      entry_or_tag = Classification.find_by(:tag_id => id) || Tag.find(id)
      delete_resource_main_action(type, entry_or_tag, data)
      action_result(true, "tags id: #{id} deleting")
    rescue ActiveRecord::RecordNotFound
      raise
    rescue => err
      action_result(false, err.to_s)
    end

    private

    def fetch_category(data)
      category_id = parse_id(data, :categories)
      category_id ||= collection_class(:categories).lookup_by_name(data["name"]).try(:id) if data["name"]
      unless category_id
        raise BadRequestError, "Category id, href or name needs to be specified for creating a new tag resource"
      end
      Category.find_by(:id => category_id)
    end
  end
end
