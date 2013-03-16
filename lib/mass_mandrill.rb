require 'mass_mandrill/config'
require 'mass_mandrill/mandrill_mailer'
require 'mass_mandrill/mandrill_mail'

module MassMandrill
  def self.config
    if block_given?
      yield Config.instance
    else
      Config.instance
    end
  end
end
