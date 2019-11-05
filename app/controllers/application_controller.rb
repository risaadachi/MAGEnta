class ApplicationController < ActionController::Base

    before_action :configure_permitted_parameters,  if: :devise_controller?
	def after_sign_in_path_for(resource_or_scope)
		stored_location_for(resource_or_scope) || root_path
	end


protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :gender, :age, :height, :email, :password, :profile_image, :deleted_flag ])
  end
end
