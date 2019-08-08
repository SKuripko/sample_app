# frozen_string_literal: true

class SearchResultsController < ApplicationController
  def create
    @results = SearchResult.new(request_params).post
    @results = JSON.parse(@results)
    end

  private

  def request_params
    {
      sro: params[:sro],
      lang: 'ru',
      auth_key: params[:auth_key]
    }
    end
end
