class BookingRequest < BaseRequest

	def path
		BASE_URI + 'avia/book?'
	end	
end	