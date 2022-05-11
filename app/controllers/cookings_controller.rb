class CookingsController < ApplicationController
  def index
    @cookings = Cooking.all.order('cooking_name ASC')
    @random4 = Cooking.order('RAND()').limit(4)
  end

  def new
    @cooking = Cooking.new
  end

  def create
    @cooking = Cooking.new(cooking_params)
    if @cooking.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @cooking = Cooking.find(params[:id])
  end

  def destroy
    @cooking = Cooking.find(params[:id])
    @cooking.destroy
    redirect_to root_path
  end

  def edit
    @cooking = Cooking.find(params[:id])
  end

  def update
    @cooking = Cooking.find(params[:id])
    if @cooking.update(cooking_params)
      redirect_to cooking_path(@cooking.id)
    else
      render :edit
    end
  end

  def imageDestroy
    @cooking = Cooking.find(params[:id])
    @cooking.image.purge
    redirect_to cooking_path(@cooking.id)
  end

  def chooseIndex
    @q = Cooking.order('RAND()').limit(1).ransack(params[:q])
  end

  def chooseSearch
    @q = Cooking.order('RAND()').limit(1).ransack(params[:q])
    @result = @q.result
    category_id = params[:q]
    staple_food_id = params[:q]
    main_dish_id = params[:q]
    side_dish_id = params[:q]
  end

  private

  def cooking_params
    params.require(:cooking).permit(:cooking_name, :category_id, :staple_food_id,
                                    :main_dish_id, :side_dish_id, :image)
  end
end
