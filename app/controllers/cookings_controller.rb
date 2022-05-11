class CookingsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :destroy]

  def index
    @cookings = Cooking.all.order('cooking_name ASC')
    @random4 = Cooking.order('RAND()').limit(4)
  end

  def new
    @cooking_form = CookingForm.new
  end

  def create
    @cooking_form = CookingForm.new(cooking_form_params)
    if @cooking_form.valid?
      @cooking_form.save
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

  def cooking_form_params
    params.require(:cooking_form).permit(:cooking_name, :image).merge(user_id: current_user.id)
  end
end
