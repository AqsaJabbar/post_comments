class CommentsController < ApplicationController
  # load_and_authorize_resource :post
  # load_and_authorize_resource :comment, :through => :post
  #before_action :create_allowed, only: [:create]
    def index
        @comments = Comment.all
      end
      def show
        @comment = Comment.find(params[:id])
      end
      def new
          @comment=Comment.new
      end
      def edit
        @post=Post.find(params[:post_id])
        @comment = Comment.find(params[:id])
      end
        
      def create
      
        @post=Post.find(params[:post_id])
        @comment = @post.comments.create(comment_params)
       
        if @comment.save
          respond_to do |format|
             format.js
          end 
        else
          flash.alert= 'You are not allowed to do this'
          render 'new'
        end
     
        
           
      end
      def update
        @post=Post.find(params[:post_id])
        @comment = Comment.find(params[:id])
        
        if @comment.update(comment_params)
          redirect_to(@post)
        else
          render 'edit'
        end
      end
    
      def destroy
        @post=Post.find(params[:post_id])
        @comment = Comment.find(params[:id])
        @comment.destroy
        redirect_to @post
      end
    private
    #  def create_allowed
    #    @post=Post.find(params[:post_id])
    #    if (@post.user_id == current_user.id)
    #     # flash.alert= 'You are not allowed to do this'
    #     redirect_to post_path(@post), notice: "You are not allowed to add comment to your own post"
    #    end
    #  end
    def comment_params
        params.require(:comment).permit(:comment,:post_id, :user_id, :rating)
    end
end
