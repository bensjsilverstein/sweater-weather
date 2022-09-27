class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])

    if !user.nil? && user.authenticate(params[:password])
      render json: UserSerializer.new(user), status: 201
    else
      render(json: { message: "User email or password is invalid." }, status: 401)
    end
  end
  
end
