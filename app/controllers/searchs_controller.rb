# frozen_string_literal: true

class SearchsController < ApplicationController
  def index; end

  def new; end

  def create
    @results = SearchRequest.new(request_params).post
    @results = JSON.parse(@results)
   end

  private

  def request_params
    result = {
      api_url:  params[:api_url],
      segments: segments_params,
      adt:      params[:adult],
      chd:      params[:child],
      inf:      params[:infant],
      class:    params[:bookingclass],
      lang:     'ru',
      auth_key: params[:auth_key]
    }
  end

  def segments_params
    result = {}
    params[:segments].each do |index, segment|
      result[index] = {
        from: segment['from'],
        to:   segment['to'],
        date: segment['date']
      }
    end
    result
  end
end
