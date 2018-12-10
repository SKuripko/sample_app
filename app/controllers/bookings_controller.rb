class BookingsController < ApplicationController
  	def create
  	  @results = BookingRequest.new(request_params).post
  	  @results = JSON.parse(@results)
  	end

	private
		def request_params
			byebug
			result = {
				tid:                   params[:tid],
				client_email:          params[:client_email],
				client_phone:          params[:client_phone],
				payer_name:            params[:payer_name],
				passengers:            passenger_params,
				agent_affiliate_fee:   params[:agent_affiliate_fee],
				partner_affiliate_fee: params[:partner_affiliate_fee],
				lang:                  'ru',	
				auth_key:              params[:auth_key]
			}
		end

		def passenger_params
			byebug
			result = {}
			params[:passengers].each do |index, passenger|
				result[index] =  {
					age:         passenger['age'],
					firstname:   passenger['firstname'],
					lastname:    passenger['lastname'],
					middlename:  passenger['middlename'],
					birthdate:   passenger['birthdate'],
					doctype:     passenger['doctype'],
					docnum:      passenger['docnum'],
					docexp:      '01.01.2030',
					gender:      passenger['gender'],
					citizen:     passenger['citizen'],
					phone:       passenger['phone'],
					email:       passenger['email'] 
				}	
			end
			result
		end		
end
