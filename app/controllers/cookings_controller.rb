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
    @cat1 = Category.where(id: category[0]&.category_id)
    @cat2 = Category.where(id: category[1]&.category_id)
    @cat3 = Category.where(id: category[2]&.category_id)
    @cat4 = Category.where(id: category[3]&.category_id)
    @cat5 = Category.where(id: category[4]&.category_id)
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

    #絞る条件のカテゴリー数と登録された料理のカテゴリー数が一致するかどうか
    cooking_ids.uniq.each do |num|
      @result1 << num if cooking_ids.group_by(&:itself)[num].length == cat_count
    end

    #自分が作った && お気に入り料理
    if params["from-mycookings"] == "on" && params["from-favorites"] == "on"
      mycookings = Cooking.ransack(user_id_eq: current_user.id)
      mycook_result = mycookings&.result.pluck(:id)
      fav_mycooking_ids = {:id_eq => []}
      if cat_count == 0
        @result1 = Cooking.all.pluck(:id)
      end
      mycook_result.each do |r|
        if @result1.include?(r)
          fav_mycooking_ids[:id_eq] << r
        end
      end

      favorites = Favorite.ransack(user_id_eq: current_user.id)
      fav_result = favorites&.result.pluck(:cooking_id)
      fav_result.each do |r|
        if @result1.include?(r) && !fav_cooking_ids[:id_eq].include?(r)
          fav_mycooking_ids[:id_eq] << r
        end
      end
      fav_mycooking_id = fav_mycooking_ids[:id_eq].sample
      if cat_count >= 1 && fav_mycooking_id.nil?
        return false
      end
      
      q2 = Cooking.order('RAND()').limit(1).ransack(id_eq: fav_mycooking_id)
  
    #自分が作った料理
    elsif params["from-mycookings"] == "on"
      mycookings = Cooking.ransack(user_id_eq: current_user.id)
      mycook_result = mycookings&.result.pluck(:id)
      mycooking_ids = {:id_eq => []}
      if cat_count == 0
        @result1 = Cooking.all.pluck(:id)
      end
      mycook_result.each do |r|
        if @result1.include?(r)
          mycooking_ids[:id_eq] << r
        end
      end
      mycooking_id = mycooking_ids[:id_eq].sample
      if cat_count >= 1 && mycooking_id.nil?
        return false
      end
      q2 = Cooking.order('RAND()').limit(1).ransack(id_eq: mycooking_id)

    #お気に入り料理
    elsif params["from-favorites"] == "on"
      favorites = Favorite.ransack(user_id_eq: current_user.id)
      fav_result = favorites&.result.pluck(:cooking_id)
      fav_cooking_ids = {:id_eq => []}
      if cat_count == 0
        @result1 = Cooking.all.pluck(:id)
      end
      fav_result.each do |r|
        if @result1.include?(r)
          fav_cooking_ids[:id_eq] << r
        end
      end
      fav_cooking_id = fav_cooking_ids[:id_eq].sample
      if cat_count >= 1 && fav_cooking_id.nil?
        return false
      end
      q2 = Cooking.order('RAND()').limit(1).ransack(id_eq: fav_cooking_id)

    #その他
    else
      q2 = Cooking.order('RAND()').limit(1).ransack(id_eq: @result1&.sample)
    end
    
    @result2 = q2&.result
    @result2 = nil if cat_count >= 1 && @result1.empty?
  end

  def incrementalSearch
    return nil if params[:keyword] == ''

    category = Category.where(['category_name LIKE ?', "%#{params[:keyword]}%"])
    render json: { keyword: category }
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
