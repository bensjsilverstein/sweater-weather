class Api::V1::UsersController < ApplicationController

  def create
    new_user = User.new(user_params)
    if new_user.save
      render json: UserSerializer.new(new_user), status: 201
    else
      render json: { error: 'Email Or Password Is Incorrect' }, status: 401
    end
  end

  private
  def user_params
    params.permit(:username, :password, :password_confirmation)
  end

end
