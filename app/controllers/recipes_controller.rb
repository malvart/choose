class RecipesController < ApplicationController

def new
  @cooking = Cooking.find(params[:cooking_id])
  @recipe = Recipe.new
end

def create
  @cooking = Cooking.find(params[:cooking_id])
  @recipe = Recipe.new(recipe_params)
  if @recipe.valid?
    @recipe.save
    redirect_to cooking_path(@cooking.id)
  else
    render :new
  end
end

private

def recipe_params
  params.require(:recipe).permit(:ingredient, :process, :duration, :plate).merge(cooking_id: @cooking.id)
end

end
