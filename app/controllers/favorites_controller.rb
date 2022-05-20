class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    @cooking = Cooking.find(params[:id])
    if current_user != @cooking.user
      @favorite = Favorite.create(user_id: current_user.id, cooking_id: @cooking.id)
    end
  end

  def destroy
    @cooking = Cooking.find(params[:id])
    @favorite = Favorite.find_by(user_id: current_user.id, cooking_id: @cooking.id)
    @favorite.destroy
  end

end
