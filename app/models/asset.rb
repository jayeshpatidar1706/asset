# frozen_string_literal: true

# class Asset
class Asset < ApplicationRecord
  has_many :asset_histories
  has_many :user
  validates :name , presence: true
  validates :purchase_date, presence: true
end

