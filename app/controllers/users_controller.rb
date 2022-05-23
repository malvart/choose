class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    fav_cooking = @user.favorites.pluck(:cooking_id)
    @favorites = Cooking.where(id: fav_cooking)
  end
end
