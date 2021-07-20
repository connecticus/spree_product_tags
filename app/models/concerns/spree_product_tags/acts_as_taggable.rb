module SpreeProductTags
  module ActsAsTaggable
    extend ActiveSupport::Concern

    included do
      acts_as_taggable_on :tags, :admin_tags
      ::Spree::PermittedAttributes.send("#{model_name.param_key}_attributes") <<
        [:tag_list, :admin_tags_list]
    end
  end
end