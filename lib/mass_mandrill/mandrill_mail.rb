require 'mandrill'

module MassMandrill
  class MandrillMail
    attr_reader :message, :template_content

    def initialize(template_name, template_content, message)
      @template_name = template_name
      @template_content = template_content
      @message = message

      @mandrill = ::Mandrill::API.new(MassMandrill.config.api_key)
    end

    def deliver
      @mandrill.messages.send_template(@template_name,
                                       @template_content,
                                       @message)
    end
  end
end
