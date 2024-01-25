class ApplicationController < ActionController::Base
	#before_action :configure_permitted_parameters, if: :devise_controller?
	before_action :authenticate_customer!, except: [:top]

    def after_sign_in_path_for(resource)
      case resource
      when Admin
      admin_admins_path
      # when Member
      # root_path
       when Customer
      root_path
      else
      root_path
      end
    end

  def after_sign_up_path_for(resource)
    case resource
    when Admin
    admin_admins_path
    # when Member
    # root_path
     when Customer
      root_path
    else
      root_path
    end
  end


    def after_sign_out_path_for(resource)
      if resource == :admin
      new_admin_session_path
      else
      new_member_session_path
      end
    end



#	protected

#	def configure_permitted_parameters
#		added_attrs = [ :last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :phone_number, :email, :password, :password_confirmation ]

#		devise_parameter_sanitizer.permit(:sign_up, keys: added_attrs)
#	end

end