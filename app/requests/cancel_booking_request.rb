# frozen_string_literal: true

class CancelBooking < BaseRequest
  def path
    'avia/bookingCancel'
  end
end
