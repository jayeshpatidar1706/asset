# frozen_string_literal: true

# class AssetsController
class AssetsController < ApplicationController
  def index
    # debugger
    @assets = Asset.all
    render json: @assets, status: 200
  end

  def create
    @asset = Asset.new(asset_params)
    if @asset.save
      render json: @asset, status: :created
    else
      render json: @asset.errors, status: :unprocessable_entity
    end
  end

  def update
    @asset = Asset.find(params[:id])
    if @asset.update(asset_params)
      render json: @asset, status: :ok
    else
      render json: { data: @asset.error.message, status: 'failed' }, status: :unprocessable_entity
    end
  end

  def show
    @asset = Asset.find(params[:id])
    render json: @asset, status: :ok
  end

  protected

  def asset_params
    params.require(:asset).permit(:name, :purchase_date, :employee_id)
  end
end
