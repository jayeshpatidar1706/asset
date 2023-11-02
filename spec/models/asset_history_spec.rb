# spec/models/asset_history_spec.rb

require 'rails_helper'

RSpec.describe AssetHistory, type: :model do
  it "is valid with valid attributes" do
    
    user = User.create(name: "John Doe", email: "john.do@example.com", password: "123456", role: "employee" , department: "IT", address: "123 Main St", BOD: Date.today, age: 32)
    asset = Asset.create(name: "Laptop", purchase_date: Date.today)
    
    asset_history = AssetHistory.new(
      asset_id: asset.id,
      assigned_at: Date.today,
      return_at: nil,
      user_name: "John Doe",
      user_id: user.id,
      asset_name:"Laptop" 
    )
    expect(asset_history).to be_valid
  end

  it "is not valid without an asset" do
    user = User.create(name: "John Doe", email: "john.do@example.com", password: "123456", role: "employee" , department: "IT", address: "123 Main St", BOD: Date.today, age: 32)
    asset_history = AssetHistory.new(
      assigned_at: Date.today,
      return_at: nil,
      user_name: "John Doe",
      user_id: user.id
    )
    expect(asset_history).to_not be_valid
  end

  it "is not valid without assigned_at" do
    user = User.create(name: "John Doe", email: "john.do@example.com", password: "123456", role: "employee" , department: "IT", address: "123 Main St", BOD: Date.today, age: 32)
    asset = Asset.create(name: "Laptop", purchase_date: Date.today)
     
    asset_history = AssetHistory.new(
      asset_id: asset.id,
      return_at: nil,
      user_name: "John Doe",
      user_id: user.id,
      asset_name:"Laptop" 
    )
    expect(asset_history).to_not be_valid
  end

  it "is not valid without user_name" do
    user = User.create(name: "John Doe", email: "john.do@example.com", password: "123456", role: "employee" , department: "IT", address: "123 Main St", BOD: Date.today, age: 32)
    asset = Asset.create(name: "Laptop", purchase_date: Date.today)
    
    asset_history = AssetHistory.new(
      asset_id: asset.id,
      return_at: nil,
      # user_name: "John Doe",
      user_id: user.id,
      asset_name:"Laptop" 
    )
    expect(asset_history).to_not be_valid
  end
end
