class Renamecolumnfromassethistroy < ActiveRecord::Migration[7.0]
  def change
    rename_column :asset_histories , :employee_name , :user_name
  end
end
