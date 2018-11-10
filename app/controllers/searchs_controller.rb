class SearchsController < ApplicationController

	def index
	end

	def new
  	end

  	def create
  	  @results = SearchRequest.new(request_params).post
  	  @results = JSON.parse(@results)
  	end

	private
		def request_params

			{
				segments: {
					0 => {
					from: params[:departure],
					to: params[:arrival],
					date: params[:date]}
#					1 => {
#					from: params[:departure1],
#					to: params[:arrival1],
#					date: params[:date1]
#					}						
					},
				adt: params[:adult],
				chd: params[:child],
				inf: params[:child],
				class: params[:bookingclass],
				lang: 'ru',	
				auth_key: params[:auth_key]	
			}
		end	
end
