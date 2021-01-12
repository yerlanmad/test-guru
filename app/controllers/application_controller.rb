class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    resource.is_a?(Admin) ? admin_root_path : user_root_path
  end
end
