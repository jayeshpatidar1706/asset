# frozen_string_literal: true

# class AddAssetNameToAssetHistory
class AddAssetNameToAssetHistory < ActiveRecord::Migration[7.0]
  def change
    add_column :asset_histories, :asset_name, :string
    add_column :asset_histories, :employee_name, :string
  end
end
