class AddRefToAssetsHistory < ActiveRecord::Migration[7.0]
  def change
    add_reference :asset_histories, :user, null: false, foreign_key: true
  end
end
