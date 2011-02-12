class PostsController < InheritedResources::Base
  actions :show, :index
  respond_to :html
end
