require 'rails_helper'

RSpec.describe Cooking, type: :model do
  let!(:cooking) { create(:cooking) }

  it "cooking_nameがある場合は登録できる" do
    expect(cooking).to be_valid
  end
end
