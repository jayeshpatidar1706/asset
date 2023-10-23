# frozen_string_literal: true

# class CreateEmployees
class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :department
      t.decimal :age
      t.string :address
      t.date :DOB

      t.timestamps
    end
  end
end
