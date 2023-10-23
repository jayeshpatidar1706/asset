# frozen_string_literal: true

# class AddRefToAssetHistory
class AddRefToAssetHistory < ActiveRecord::Migration[7.0]
  def change
    add_reference :asset_histories, :employee, null: false, foreign_key: true
  end
end
