# frozen_string_literal: true

class SearchsController < ApplicationController
  def index; end

  def new; end

  def create
    @results = SearchRequest.new(request_params).post
    @results = JSON.parse(@results)

    @sro = @results['data']['sro']

    @search_results = SearchResult.new(
      api_url: params[:api_url],
      sro: @sro,
      auth_key: params[:auth_key],
      lang: 'ru').post
    @search_results = JSON.parse(@search_results)
  end

  private

  def request_params

    result = {
      api_url:         params[:api_url],
      segments:        segments_params,
      adt:             params[:adult],
      chd:             params[:child],
      inf:             params[:infant],
      class:           params[:booking_class],
      lang:            'ru',
      auth_key:        params[:auth_key]
    }
    result[:filter_airlines] = params[:include_airlines].split(',') if params[:include_airlines].present?
    result[:gds_white_list]  = params[:include_gds].split(',') if params[:include_gds].present?
    result[:gds_black_list]  = params[:exclude_gds].split(',') if params[:exclude_gds].present?
    result
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