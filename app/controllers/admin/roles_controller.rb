class Admin::RolesController < InheritedResources::Base
  authorize_resource :class => 'Admin::Role'

  respond_to :html
end 
