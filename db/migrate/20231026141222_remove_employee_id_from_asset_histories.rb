class RemoveEmployeeIdFromAssetHistories < ActiveRecord::Migration[7.0]
  def change
    remove_column :asset_histories, :employee_id  
  end
end
