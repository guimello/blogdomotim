class PostsController < ApplicationController
  respond_to :html
  respond_to :xml, :only => :index

  authorize_resource

  before_filter :find_current, :only => :show

  def index
    @posts = Post.latest.page(params[:page]).per(params[:per])

    render 'posts.xhr' and return if request.xhr?
    respond_with @posts
  end

  def show
    respond_with @post
  end

  protected

  def find_current
    @post = Post.find(params[:id])
  end
end
