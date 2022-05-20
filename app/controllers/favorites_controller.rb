class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    @cooking = Cooking.find(params[:cooking_id])
    if current_user.id != @cooking.user_id
      @favorite = Favorite.create(user_id: current_user.id, cooking_id: @cooking.id)
    end
    redirect_back fallback_location: cooking_path(@cooking.id)
  end

  def destroy
    @cooking = Cooking.find(params[:cooking_id])
    @favorite = Favorite.find_by(user_id: current_user.id, cooking_id: @cooking.id)
    @favorite.destroy
    redirect_back fallback_location: cooking_path(@cooking.id)
  end

end
