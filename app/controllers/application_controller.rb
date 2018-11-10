class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	include SessionsHelper
	before_action :get_user

	def get_user
		@user = current_user
	end	
end
