class Admin::PostsController < InheritedResources::Base
  actions :new, :create, :edit, :update, :destroy
end
