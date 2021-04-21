class Api::V1::UsersController < ApplicationController
  def update
    user = User.find(params[:id])
    
    if params[:avatar]
      user.avatar.attach(user_params[:avatar])

      if user.save!
        render json: {"success" => {"message" => "Avatar updated"}}, status:200
      else
        render json: {"error" => {"message" => "Avatar not updated"}}, status:400
      end
    else
      render json: {"error" => {"message" => "Avatar not updated"}}, status:400
    end
  end

  private
    def user_params
      params.permit(:id, :avatar)
    end
end