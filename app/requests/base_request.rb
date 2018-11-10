class BaseRequest
	
	BASE_URI = 'https://api.myagent.online/api/'

	def initialize(params)
  		@params = params
	end	

	def get
		RestClient.get(path, @params)
	end

	def post
		RestClient.post(path, @params)
	end	
end