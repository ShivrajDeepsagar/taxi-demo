class TripsController < ApplicationController

  before_action :check_valid_params

  def start
    trip = Trip.find(params[:id])
    if trip.start_trip(params[:lat], params[:long])
      response = { status: 'success', message: 'Ride Started' }
    else
      response = { status: 'failure', message: 'Sorry.trip could not be started' }
    end
    render json: response
  end

  def end
    trip = Trip.find(params[:id])
    if trip.end_trip(params[:lat], params[:long])
      trip.caculate_and_update_amount
      response = { status: 'success', message: 'Ride End', amount: "#{trip.amount} Dogecoin" }
    else
      response = { status: 'failure', message: 'Sorry.Could not end trip' }
    end
    render json: response
  end

  private

  def check_valid_params
    if params[:lat].nil? || params[:long].nil?
      render json: { status: 'failure', message: 'Bad Request! Please enter proper params' }, status: 400
    end
  end
end
