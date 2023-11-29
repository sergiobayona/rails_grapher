module RailsGrapher
  class ProjectControllers
    EXCLUDED_CONTROLLERS = [ActiveStorage::Representations::RedirectController,
                            ActiveStorage::Representations::ProxyController,
                            ActiveStorage::Representations::BaseController,
                            ActiveStorage::Blobs::RedirectController,
                            ActiveStorage::Blobs::ProxyController,
                            ActiveStorage::DiskController,
                            ActiveStorage::DirectUploadsController,
                            ActiveStorage::BaseController,
                            Rails::Conductor::ActionMailbox::InboundEmails::SourcesController,
                            Rails::Conductor::ActionMailbox::ReroutesController,
                            Rails::Conductor::ActionMailbox::IncineratesController,
                            Rails::Conductor::ActionMailbox::InboundEmailsController,
                            ActionMailbox::Ingresses::Sendgrid::InboundEmailsController,
                            ActionMailbox::Ingresses::Relay::InboundEmailsController,
                            ActionMailbox::Ingresses::Postmark::InboundEmailsController,
                            ActionMailbox::Ingresses::Mandrill::InboundEmailsController,
                            ActionMailbox::Ingresses::Mailgun::InboundEmailsController,
                            Rails::Conductor::BaseController,
                            ActionMailbox::BaseController,
                            ActionView::TestCase::TestController,
                            RailsGrapher::GraphsController,
                            RailsGrapher::ApplicationController]

    def self.all
      Rails.application.eager_load!
      controllers = ObjectSpace.each_object(Class).select { |klass| klass < ActionController::Base }
      project_controllers = controllers.reject { |controller| EXCLUDED_CONTROLLERS.include?(controller) }

      project_controllers.each_with_object({}) do |controller, res|
        res[controller] = new(controller).definition
      end
    end

    def initialize(controller)
      @controller = controller
    end

    def definition
      ControllerMeta::DEFINITIONS.each_with_object({}) do |attribute, _hash|
        _hash[attribute.to_s] = ControllerMeta.new(@controller).send(attribute)
      end
    end
  end
end
