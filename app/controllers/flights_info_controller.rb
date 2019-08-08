# frozen_string_literal: true

class FlightsInfoController < ApplicationController
  def create
    @results = FlightInfo.new(request_params).post
    @results = JSON.parse(@results)
  end

  private

  def request_params
    {
      tid: params[:tid],
      lang: 'ru',
      auth_key: params[:auth_key]
    }
    end
end
