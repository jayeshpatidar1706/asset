  # frozen_string_literal: true

  # class AssetsHistoryController
  class AssetHistoryController < ApplicationController 
    load_and_authorize_resource
    
    def index
      
      @history = AssetHistory.all
      render json: @history, status: :ok
    end

    def show
      @history = AssetHistory.where(asset_id: params[:id])
      render json: @history, status: :ok
    end

    def return_asset
      @h = AssetHistory.where(return_at: nil)
      @history = @h.find_by(asset_id: params[:id])
      if @history.nil?
        render json: { data: 'this item was not issued' }
      else
        @history.update(return_at: Time.now)
        render json: @history, status: :ok
      end
    end

    def ehistory

    end


    def myhistory
      @history = AssetHistory.where(user_id: current_user.id)
      render json:@history, status: :ok
    end

    def issue_asset
      # debugger
      @asset_id = params[:assets_history][:asset_id]
      @assethistory = AssetHistory.where(asset_id: @asset_id)
      if @assethistory.empty?
        issue
      else
        @a = @assethistory.find_by(return_at: nil)
        if @a.nil?
          issue
        else
          render json: { data: 'you can not issue this asset' }, status: :ok
        end
      end
    end

    protected

    def assethistory_params
      params.require(:assets_history).permit(:asset_id, :user_id, :asset_name, :employee_name)
    end

    def issue
      @history = AssetHistory.new(assethistory_params)
      return unless @history.save

      @history.update(assigned_at: Time.now)
      render json: { data: 'Asset is issued successfully' }, status: :ok
    end

  end
