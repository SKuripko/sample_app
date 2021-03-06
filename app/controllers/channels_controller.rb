# frozen_string_literal: true

class ChannelsController < ApplicationController
  def index
    @channel = Channel.search(params[:term])
    render json: @channel.map(&:code)
  end
end
