class UsersController < ApplicationController

  def create
    begin
      User.create!(user_params)
      render json: 'OK', status: :ok
    rescue ActiveRecord::RecordInvalid => _
      user = User.generate_nickname
      render json: user.nickname, status: :ok
    end
  end

  private

  def user_params
    params.permit(:nickname)
  end
end
