# frozen_string_literal: true

# class EmployeesController
class EmployeesController < ApplicationController
  load_and_authorize_resource
  
  def index
    @employee = USer.all
    render json: @employee, status: :ok
  end

  def create
    @employee = User.new(emp_params)
    if @employee.save
      render json: @employee, status: :ok
    else
      render json: @employee.error.message, status: :unprocessable_entity
    end
  end

  def update
    @employee = User.find(params[:id])
    if @employee.update(emp_params)
      render json: @employee, status: :ok
    else
      render json: @employee.error, status: :unprocessable_entity
    end
  end

  def show
    @employee = User.find(params[:id])
    render json: @employee, status: :ok
  end

  protected

  def emp_params
    params.require(:user).permit(:email:, :password, :name, :department, :age, :address, :BOD)
  end
end
