require 'rails_helper'

RSpec.describe Asset, type: :model do
  
let(:system)do
Asset.new(name: 'laptop',purchase_date: "01-11-23")
end


it 'it has many asset_histories' do 
expect(system).to respond_to(:asset_histories)
end

it "is not valid without a name" do
    asset = Asset.new(purchase_date: Date.today)
    expect(asset).to_not be_valid
end

it "is not valid without a purchase_date" do
    asset = Asset.new(name: "Laptop")
    expect(asset).to_not be_valid
end


  it "is valid when associated with asset_histories" do
    asset = Asset.create(name: "Laptop", purchase_date: Date.today)
    user = User.create(
      name: "John Doe",
      email: "john.doe@example.com",
      role: "employee",
      password: "example123",
      age: 30
    )
  end
    # asset_history = AssetHistory.new(
    #     asset_id: asset.id,    
    #     assigned_at: Date.today,
    #     return_at: nil,
    #     user_name: "John Doe",
    #     user_id: user.id
    #   )
    #  asset.asset_histories << asset_history
    #  expect(asset).to be_valid
    # end
end