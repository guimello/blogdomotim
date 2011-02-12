class Admin::PostsController < InheritedResources::Base
  actions :new, :create, :edit, :update, :destroy
  
  authorize_resource

  respond_to :html

  def create
    create! do |success, failure|
      success.html { redirect_to post_path(@post) }
    end
  end

  def update
    update! do |success, failure|
      success.html { redirect_to post_path(@post) }
    end
  end

  protected

  def begin_of_association_chain
    current_user
  end
end
