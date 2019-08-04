require 'authy'

class TwilioAuthy
  API_KEY = "hx0sw27XScVaHCiySMvSudtnaTODPsD0 "
  API_URI  = 'https://api.authy.com'
  
  attr_accessor :user
  
  def initialize(options)
    Authy.api_key = API_KEY
    Authy.api_uri = API_URI
    self.user = options[:user]
  end
  
  def user_status
    
  end
  
  def register_user
    authy = Authy::API.register_user(:email => user.email, :cellphone => user.phone_number, :country_code => user.country_code)
    user.update_attribute(:authy_id, authy.id) if authy.ok?
  end
  
  def verify_user(token)
    response = Authy::API.verify(:id => user.authy_id, :token => token)
    if response.ok?
      true
    else
      response.errors
    end
  end
  
  def request_sms
    if user.authy_id.blank?
      self.register_user
      return nil unless user.reload.authy_id
    end
    response = Authy::API.request_sms(:id => user.authy_id, :force => true)
    if response.ok?
      return true
    else
      response.errors
    end
  end
end