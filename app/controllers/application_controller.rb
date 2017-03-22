class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :current_tenant

  private

  def current_tenant
    if current_user.present?
      current_user.tenant
    else
      "Default"
    end
  end

  helper_method :current_tenant

end
