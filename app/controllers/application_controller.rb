# frozen_string_literal: true

# class ApplicationController
class ApplicationController < ActionController::API
     before_action :authenticate_user!
     before_action :configure_permitted_parameters, if: :devise_controller?
    # load_and_authorize_resource
    protected
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:email, :password, :name, :department, :age, :role, :address, :BOD) }
        devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:email, :password, :name, :department, :age, :role, :address, :BOD) }
    end
      
end
    