class PostsController < ApplicationController
  load_and_authorize_resource
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  def index
    @posts = Post.all
  end
  def show
    @comment=Comment.new
    @comments=@post.comments
    #@post = Post.find(params[:id])
  end
  def new
      @post=Post.new
  end
  def edit
    @post = Post.find(params[:id])
    #@post = current_user.post
  end
    
  def create
    
    @post = Post.new(post_params)
      if @post.save
          redirect_to @post
      else
          render 'new'
      end
  end
  def update
    @post = Post.find(params[:id])
 
    if @post.update(post_params)
      redirect_to(@post)
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
 
    redirect_to @post
  end
  def approve
    @post=Post.find(params[:id])
    @post.update(status: "active")
    redirect_to posts_path    
  end


      private
    def set_post
      @post = Post.find(params[:id])
    end  
    def post_params
      params.require(:post).permit(:title, :description, :user_id, images: [])
    end
end
