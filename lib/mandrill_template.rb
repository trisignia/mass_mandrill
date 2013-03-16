require 'mandrill_template/config'
require 'mandrill_template/mandrill_mailer'
require 'mandrill_template/mandrill_mail'

module MandrillTemplate
  def self.config
    if block_given?
      yield Config.instance
    else
      Config.instance
    end
  end
end
