# frozen_string_literal: true

class BaseRequest
  # BASE_URI = 'https://api.myagent.online/api/'
  #  BASE_URI = params[:url]

  def initialize(params)
    @params  = params
    @api_url = @params[:api_url] || 'https://api.myagent.online/api/'
  end

  def get
    RestClient.get(@api_url + path, @params)
  end

  def post
    RestClient.post(@api_url + path, @params)
  end
end
