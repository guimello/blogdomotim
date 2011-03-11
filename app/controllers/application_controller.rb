class ApplicationController < ActionController::Base
  protect_from_forgery

  helper :layout

  before_filter :authenticate_user!, :if => proc { |c| c.admin_controller? }
  
  before_filter :set_default_per_page_on_pagination

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = exception.message
    redirect_to root_url
  end

  def admin_controller?
    self.class.name =~ /^Admin::/
  end  

  def set_default_per_page_on_pagination
    params[:per] ||= 3
  end
end
