# frozen_string_literal: true

# class AddColumnsToAsset.
class AddColumnsToAsset < ActiveRecord::Migration[7.0]
  def change
    add_column :assets, :purchase_date, :date
    add_reference :assets, :employee, null: true, foreign_key: true
  end
end
