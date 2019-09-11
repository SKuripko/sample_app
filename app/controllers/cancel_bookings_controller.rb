# frozen_string_literal: true

class CancelBookingsController < ApplicationController
  def create
    @results = CancelBookingRequest.new(request_params).post
    @results = JSON.parse(@results)
  end

  private

  def request_params
    {
      lang:           'ru',
      auth_key:       params[:auth_key],
      billing: params[:billing]
    }
    end
end
