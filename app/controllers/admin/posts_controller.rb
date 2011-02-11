class Admin::PostsController < InheritedResources::Base
  actions :new, :create, :edit, :update, :destroy
  
  authorize_resource
end
