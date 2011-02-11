class ApplicationController < ActionController::Base
  protect_from_forgery

  helper :layout

  before_filter :authenticate_user!, :if => proc { |c| c.admin_controller? }
  
  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = exception.message
    redirect_to root_url
  end

  def admin_controller?
    self.class.name =~ /^Admin::/
  end  
end
