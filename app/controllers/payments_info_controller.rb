# frozen_string_literal: true

class PaymentsInfoController < ApplicationController
  def create
    @results = PaymentInfo.new(request_params).post
    @results = JSON.parse(@results)
  end

  private

  def request_params
    {
      sig:                params[:sig],
      lang:               'ru',
      auth_key:           params[:auth_key],
      billing_number:     params[:billing],
      merchant_name:      'balanceMa',
      with_affiliate_fee: '0'
    }
    end
end
