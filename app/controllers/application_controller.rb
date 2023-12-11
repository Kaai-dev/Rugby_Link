class ApplicationController < ActionController::Base

    rescue_from 'ActiveRecord::RecordNotFound' do |exception|
        reset_session
        # Redirect to login page or show a message
        redirect_to new_user_session_path, alert: "Your session data is invalid. Please log in again."
    end

end
