class AuthorizationKeysController < ApplicationController

	def index
	end

	def new
  	end

  	def create
  	  @results = AuthorizationRequest.new(request_params).post
  	  @results = JSON.parse(@results)
  	end

	private
		def request_params
			{
				login:    params[:login],
				password: params[:password]
			}
		end	
end
