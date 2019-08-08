# frozen_string_literal: true

class FareFamiliesController < ApplicationController
  def create
    @results = FareFamily.new(request_params).post
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
