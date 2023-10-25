# frozen_string_literal: true

# class ApplicationController
class ApplicationController < ActionController::API
    before_action :authenticate_user!
    load_and_authorize_resource
    
end
