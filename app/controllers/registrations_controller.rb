class RegistrationsController < Devise::RegistrationsController
  before_action :authenticate_user!
    
  def after_sign_up_path_for(resource)
    user_path(resource)
  end

  private

      def sign_up_params
        params.require(:user).permit(:email, :password, :password_confirmation)
      end
      
      def account_update_params
        params.require(:user).permit(:email, :password, :password_confirmation)
      end
end