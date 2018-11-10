class AuthorizationRequest < BaseRequest
	def path
    	BASE_URI + 'user/login?'
	end  	
end