class CabsController < ApplicationController
  before_action :check_valid_params, only: [:book_nearest]

  def index
    cabs = Cab.available_cabs
    render json: { status: 'success', cabs: cabs }
  end

  def book_nearest
    color = params[:color].blank? ? nil : params[:color].to_s
    cab = Cab.nearest(params[:loc].to_f, params[:lat].to_f, color)
    if cab.nil?
      response = { status: 'failure', message: 'Sorry no cabs are available' }
    else
      trip = cab.book(params[:customer_id], params[:loc], params[:lat])
      if trip
        response = { status: 'success', cab: cab, trip_id: trip.id, message: 'Booking Success' }
      else
        response = { status: 'failure', message: 'Sorry! Failed to book trip' }
      end
    end
    render json: response
  end

  def check_valid_params
    if params[:lat].nil? || params[:long].nil? || params[:customer_id].nil?
      render json: { status: 'failure', message: 'Bad Request! Please enter proper params' }, status: 400
    end
  end
end
