class UsersController < ApplicationController
  def update
    user = User.find(params[:id])
    if params[:avatar] && user.avatar.attached?
      user.avatar.attach(user_params[:avatar])
      user.save!
    elsif params[:avatar]
      user.avatar.attach(user_params[:avatar])
      user.save!
    end
  end

  private
    def user_params
      params.permit(:id, :avatar)
    end
end