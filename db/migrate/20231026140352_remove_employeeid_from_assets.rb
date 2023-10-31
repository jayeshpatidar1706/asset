# frozen_string_literal: true

# class RemoveEmployeeidFromAssets
class RemoveEmployeeidFromAssets < ActiveRecord::Migration[7.0]
  def change
    remove_column :assets, :employee_id
  end
end
