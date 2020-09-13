class CabsController < ApplicationController
  def index
    cabs = Cab.all
    render json: { status: 'success', cabs: cabs } 
  end
end
