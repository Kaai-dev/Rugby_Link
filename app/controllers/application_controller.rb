class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    add_flash_types :info, :danger, :warning, :success


    rescue_from 'ActiveRecord::RecordNotFound' do |exception|
        reset_session
        # Redirect to login page or show a message
        redirect_to new_user_session_path, alert: "Your session data is invalid. Please log in again."
    end

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    end

end
