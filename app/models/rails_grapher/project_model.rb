module RailsGrapher
  class ProjectModel
    # cattr_reader :all_project_models # , :attributes, :associations, :validations, :scopes, :methods

    EXCLUDED_MODELS = %w[ ActionText::Record
                          ActiveStorage::Record
                          ActionMailbox::Record
                          RailsGrapher::ApplicationRecord
                          ApplicationRecord
                          ActionText::RichText
                          ActionText::EncryptedRichText
                          ActiveStorage::VariantRecord
                          ActiveStorage::Attachment
                          ActiveStorage::Blob
                          ActionMailbox::InboundEmail ]
    def self.all
      Rails.application.eager_load!
      all_ar_descendents = ActiveRecord::Base.descendants.map(&:name)
      project_models = all_ar_descendents.reject { |model| EXCLUDED_MODELS.include?(model) }
      @all_project_models = project_models.sort
      project_meta
    end

    def self.project_meta
      meta_attributes = RailsGrapher::ModelMeta.instance_methods(false).sort
      meta = {}
      @all_project_models.each do |model|
        meta[model] = meta_attributes.each_with_object({}) do |attribute, _hash|
          _hash[attribute.to_s] = RailsGrapher::ModelMeta.new(model).send(attribute)
        end
      end
      meta
    end
  end
end
