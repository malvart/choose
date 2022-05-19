class CookingsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :destroy, :imageDestroy]
  before_action :find_cooking, only: [:show, :destroy, :edit, :update, :imageDestroy]
  before_action :varify_user, only: [:edit, :destroy, :imageDestroy]

  def index
    @cookings = Cooking.all.order('cooking_name ASC')
    @random4 = Cooking.order('RAND()').limit(4)

    keyword = params[:q]
    @q1 = Category.ransack(keyword)
    @q2 = Cooking.ransack(keyword)
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
    @cooking_form = CookingForm.new(cooking_attributes)
    category = CookingCategory.where(cooking_id: @cooking.id)
    cat_id1 = category[0]
    cat_id2 = category[1]
    cat_id3 = category[2]
    cat_id4 = category[3]
    cat_id5 = category[4]
    @cat1 = Category.where(id: cat_id1&.category_id)
    @cat2 = Category.where(id: cat_id2&.category_id)
    @cat3 = Category.where(id: cat_id3&.category_id)
    @cat4 = Category.where(id: cat_id4&.category_id)
    @cat5 = Category.where(id: cat_id5&.category_id)
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
    @cooking.image.purge
    redirect_to cooking_path(@cooking.id)
  end

  def chooseIndex
    keyword = params[:q]
    @q1 = CookingCategory.ransack(keyword)

    @cat_range1 = Range.new(1, 3)
    @cat_range2 = Range.new(4, 6)
    @cat_range3 = Range.new(7, 9)
    @cat_range4 = Range.new(10, 12)
    @cat_range5 = Range.new(1, 12)
  end

  def chooseSearch
    keyword = params[:q]
    @q1 = CookingCategory.ransack(keyword)
    cat_count = params[:q][:category_id_in].uniq.reject(&:blank?).length
    cooking_ids = @q1&.result.pluck(:cooking_id)
    @result1 = []
    cooking_ids.uniq.each do |num|
      if cooking_ids.group_by(&:itself)[num].length == cat_count
        @result1 << num
      end
    end

    q2 = Cooking.order('RAND()').limit(1).ransack(id_eq: @result1&.sample)
    @result2 = q2&.result
    if cat_count >= 1 && @result1.empty?
      @result2 = nil
    end
  end

  def incrementalSearch
    return nil if params[:keyword] == ""
    category = Category.where(['category_name LIKE ?', "%#{params[:keyword]}%"] )
    render json:{ keyword: category }
  end

  def categorySearch
    keyword = params[:q]
    @q = Category.ransack(keyword)
    @result = @q&.result
  end

  def cookingSearch
    keyword = params[:q]
    @q = Cooking.order('cooking_name ASC').ransack(keyword)
    @result = @q&.result
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
