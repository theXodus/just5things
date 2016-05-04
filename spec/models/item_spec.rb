require 'rails_helper'

RSpec.describe Item, type: :model do
  it "has a valid factory" do
    item = FactoryGirl.create(:item)
    expect(item).to be_valid
  end

  it "is invalid without a name" do
    item = Item.create(name: nil)
    expect(item).not_to be_valid
  end



end
