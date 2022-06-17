require 'rails_helper'

RSpec.describe Cooking, type: :model do
  before do
    @cooking = FactoryBot.build(:cooking)
  end

  describe "料理登録" do
    context "料理を登録できる場合" do
      it "cooking_nameがある場合は登録できる" do
        expect(@cooking).to be_valid
      end
      it "imageはなくても登録できる" do
        @cooking.image = nil
        expect(@cooking).to be_valid
      end
    end
    context "料理を登録できない場合" do
      it "cooking_nameが空では登録できない" do
        @cooking.cooking_name = ""
        @cooking.valid?
        expect(@cooking.errors.full_messages).to include("Cooking nameを入力してください") 
      end
      it "userが結びついていないと登録できない" do
        @cooking.user = nil
        @cooking.valid?
        expect(@cooking.errors.full_messages).to include("Userを入力してください")
      end
    end
  end
end
