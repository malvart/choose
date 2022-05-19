class RecipesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :find_cooking, only: [:new, :create, :edit, :update]
  before_action :varify_user, only: [:new, :edit]

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.valid?
      @recipe.save
      redirect_to cooking_path(@cooking.id)
    else
      render :new
    end
  end

  def edit
    @recipe = @cooking.recipe
  end

  def update
    @recipe = @cooking.recipe
    if @recipe.update(recipe_params)
      redirect_to cooking_path(@cooking.id)
    else
      render :edit
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:ingredient, :process, :duration, :plate).merge(cooking_id: @cooking.id)
  end

  def find_cooking
    @cooking = Cooking.find(params[:cooking_id])
  end

  def varify_user
    redirect_to root_path unless current_user == @cooking.user
  end
end
