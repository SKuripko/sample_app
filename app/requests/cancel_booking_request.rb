# frozen_string_literal: true

class CancelBookingRequest < BaseRequest
  def path
    'avia/bookingCancel'
  end
end
