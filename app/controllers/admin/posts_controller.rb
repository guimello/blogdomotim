class Admin::PostsController < InheritedResources::Base
  actions :new, :create, :edit, :update, :destroy
  
  authorize_resource

  respond_to :html

  def create
    create! { post_path @post }
  end

  def update
    update! { post_path @post }
  end

  protected

  def begin_of_association_chain
    current_user
  end
end
