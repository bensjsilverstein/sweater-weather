class Api::V1::RoadTripsController < ApplicationController

  def create
    user = User.find_by(api_key: request_params[:api_key]) if request_params
      if !request_params
        render json: { error: 'missing JSON payload in request body' }, status: 400
      elsif !(request_params[:origin] && request_params[:destination])
        render json: { error: 'You need to include start point and end point' }, status: 400
      elsif user
        render json: RoadTripSerializer.create_roadtrip(request_params[:origin], request_params[:destination])
      else
        render json: { error: 'invalid credentials' }, status: 401
      end
  end
  private

  def request_params
    JSON.parse(request.raw_post, symbolize_names: true) unless ['', nil].include?(request.raw_post)
  end
end
