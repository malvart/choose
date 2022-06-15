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
  end
end
