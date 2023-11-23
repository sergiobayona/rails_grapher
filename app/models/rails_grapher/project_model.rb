module RailsGrapher
  class ProjectModel
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
      all_project_models = all_ar_descendents.reject { |model| EXCLUDED_MODELS.include?(model) }
      all_project_models.sort
    end
  end
end
