# frozen_string_literal: true

class PaymentBookingsController < ApplicationController
  def create
    @results = ComplitePayment.new(request_params).post
    @results = JSON.parse(@results)
  end

  private

  def request_params
    {
      auth_key:           params[:auth_key],
      billing_number:     params[:billing]
    }
    end		
end
