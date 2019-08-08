# frozen_string_literal: true

class AuthorizationKeysController < ApplicationController
  def index; end

  def new; end

  def create
    @results = AuthorizationRequest.new(request_params).post
    @results = JSON.parse(@results)
   end

  private

  def request_params
    {
      api_url:  params[:api_url],
      login:    params[:login],
      password: params[:password]
    }
  end
end
