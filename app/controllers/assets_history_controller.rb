# frozen_string_literal: true

# class AssetsHistoryController
class AssetsHistoryController < ApplicationController
  def index
    @history = AssetHistory.all
    render json: @history, status: :ok
  end

  def show
    @history = AssetHistory.where(asset_id: params[:id])
    render json: @history, status: :ok
  end

  def return_asset
    # debugger

    @h = AssetHistory.where(return_at: nil)
    @history = @h.find_by(asset_id: params[:id])
    if @history.nil?
      render json: { data: 'this item was not issued' }
    else
      @history.update(return_at: Time.now)
      render json: @history, status: :ok
    end
  end

  def issue_asset
    # debugger
    @asset_id = params[:assets_history][:asset_id]
    @assethistory = AssetHistory.where(asset_id: @asset_id)
    if @assethistory.empty?
      issue
      render json: { data: 'aaaaaaa' }, status: :ok
    else
      @a = @assethistory.find_by(return_at: nil)
      if @a.nil?
        issue
        render json: { data: 'bbbbbbb' }, status: :ok
      else
        render json: { data: 'unsuccessful' }, status: :ok
      end
    end
  end

  protected

  def assethistory_params
    params.require(:assets_history).permit(:asset_id, :employee_id, :asset_name, :employee_name)
  end

  def issue
    @history = AssetHistory.new(assethistory_params)
    return unless @history.save

    @history.update(assigned_at: Time.now)
  end
end
