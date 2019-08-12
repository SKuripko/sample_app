# frozen_string_literal: true

class BaseUrlsController < ApplicationController
  def show; end

  def new
    @api_url = BaseUrl.new
  end

  def create
    @api_url = BaseUrl.new(api_url_params)
    if @api_url.save
      flash[:success] = 'New API URL added!'
      redirect_to authorization_path
    else
      render 'new'
    end
   end

  private

  def api_url_params
    params.require(:base_url).permit(:name, :value)
   end
end
