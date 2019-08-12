# frozen_string_literal: true

class ComplitePayment < BaseRequest
  def path
    'payment/pay-with-balance'
  end
end
