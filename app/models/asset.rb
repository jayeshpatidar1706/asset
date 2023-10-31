# frozen_string_literal: true

# class Asset
class Asset < ApplicationRecord
  has_many :asset_histories
  belongs_to :user
end
