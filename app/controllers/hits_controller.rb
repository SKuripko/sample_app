class HitsController < ApplicationController

  def index
  	@hits = Hit.listing(params)
	gon.push(hits: @hits)
  end

  def show
    @hit = Hit.find_by(supplier_code: params[:supplier_code])    
  end		
end
