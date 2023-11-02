# frozen_string_literal: true

# class AssetHistory
class AssetHistory < ApplicationRecord
  belongs_to :asset
  belongs_to :user
  validates :assigned_at ,presence: :true
  validates :asset_name ,presence: :true
end
