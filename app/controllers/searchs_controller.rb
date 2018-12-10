class SearchsController < ApplicationController

	def index
	end

	def new
  	end

  	def create
  	   byebug
  	  @results = SearchRequest.new(request_params).post
  	  @results = JSON.parse(@results)
  	end

	private
		def request_params
			result = {
				segments: segments_params,
				adt:      params[:adult],
				chd:      params[:child],
				inf:      params[:child],
				class:    params[:bookingclass],
				lang:     'ru',	
				auth_key: params[:auth_key]
			}
		end

		def segments_params
			
			result = {}
			params[:segments].each do |index, segment|
				result[index] =  {
					from: segment['from'],
					to:   segment['to'],
					date: segment['date']
				}	
			end
			result
		end				
end
