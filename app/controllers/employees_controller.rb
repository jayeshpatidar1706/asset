# frozen_string_literal: true

# class EmployeesController
class EmployeesController < ApplicationController
  def index
    @employee = Employee.all
    render json: @employee, status: :ok
  end

  def create
    @employee = Employee.new(emp_params)
    if @employee.save
      render json: @employee, status: :ok
    else
      render json: @employee.error.message, status: :unprocessable_entity
    end
  end

  def update
    @employee = Employee.find(params[:id])
    if @employee.update(emp_params)
      render json: @employee, status: :ok
    else
      render json: @employee.error, status: :unprocessable_entity
    end
  end

  def show
    @employee = Employee.find(params[:id])
    render json: @employee, status: :ok
  end

  protected

  def emp_params
    params.require(:employee).permit(:name, :department, :age, :address, :DOB)
  end
end
