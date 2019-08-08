# frozen_string_literal: true

class AuthorizationRequest < BaseRequest
  def path
    'user/login'
  end
end
