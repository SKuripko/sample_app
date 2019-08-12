# frozen_string_literal: true

class BookingsInfoController < ApplicationController
  def create
    @results = BookingInfo.new(request_params).post
    @results = JSON.parse(@results)
  end

  private

  def request_params
    {
      sig:            params[:sig],
      lang:           'ru',
      auth_key:       params[:auth_key],
      billing_number: params[:billing]
    }
    end
end
