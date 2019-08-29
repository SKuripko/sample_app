# frozen_string_literal: true

class HitsController < ApplicationController
  def index
    @channel                    = params[:channel]
    @date_from                  = params[:date_from]
    @date_to                    = params[:date_to]
    @supplier_code              = params[:supplier_code]
    @second_validating_supplier = params[:second_validating_supplier]
    @provider_name              = params[:provider_name]

    @items = Hit.listing(params)
    gon.push(hits: @items)
  end

  def show
    @hit = Hit.find_by(supplier_code: params[:supplier_code])
  end
end
