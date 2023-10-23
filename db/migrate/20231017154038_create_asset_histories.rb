# frozen_string_literal: true

# class CreateAssetHistories
class CreateAssetHistories < ActiveRecord::Migration[7.0]
  def change
    create_table :asset_histories do |t|
      t.references :asset, null: false, foreign_key: true
      t.time :assigned_at
      t.time :return_at
      t.timestamps
    end
  end
end
