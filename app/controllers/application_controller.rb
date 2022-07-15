class ApplicationController < ActionController::Base
    def user_url
        redirect_to root_path
    end
    private
    def sign_up_params
        params.require(:user).permit(:username,  :password, :password_confirmation)
    end
    
    def account_update_params
        params.require(:user).permit( :username, :password,:password_confirmation,:current_password)
    end
    
    def configure_permitted_parameters
        attributes = [:username,:password, :password_confirmation]
        devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
        devise_parameter_sanitizer.permit(:account_update, keys: attributes)
    end
end