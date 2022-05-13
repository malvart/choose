class CookingsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :destroy]
  before_action :find_cooking, only: [:show, :destroy, :edit, :update]
  before_action :varify_user, only: [:edit, :destroy]

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
  end

  def destroy
    @cooking.destroy
    redirect_to root_path
  end

  def edit
    cooking_attributes = @cooking.attributes
    @cookig_form = CookingForm.new(cooking_attributes)
  end

  def update
    @cooking_form = CookingForm.new(cooking_form_params)
    @cooking_form.image ||= @cooking.image.blob if @cooking_form.image.present?

    if @cooking_form.valid?
      @cooking_form.update(cooking_form_params, @cooking)
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
    keyword = params[:q]
    @q1 = CookingCategory.order('RAND()').limit(1).ransack(keyword)
    @result1 = @q1.result
    @result1.each do |r|
      @q2 = Cooking.order('RAND()').limit(1).ransack(id_eq: r.cooking_id)
    end
    @cat_range1 = Range.new(1, 3)
    @cat_range2 = Range.new(4, 6)
    @cat_range3 = Range.new(7, 9)
    @cat_range4 = Range.new(10, 12)
  end

  def chooseSearch
    keyword = params[:q]
    @q1 = CookingCategory.order('RAND()').limit(1).ransack(keyword)
    @result1 = @q1&.result
    @result1.each do |r|
      @q2 = Cooking.order('RAND()').limit(1).ransack(id_eq: r.cooking_id)
    end
    @result2 = @q2&.result
    category_id = params[:q]
  end

  private

  def cooking_form_params
    params.require(:cooking_form).permit(:cooking_name, :image, category_name: []).merge(user_id: current_user.id)
  end

  def find_cooking
    @cooking = Cooking.find(params[:id])
  end

  def varify_user
    redirect_to root_path unless current_user.id == @cooking.user_id
  end
end
