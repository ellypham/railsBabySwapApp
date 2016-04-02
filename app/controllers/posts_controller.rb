  class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
  	if params[:q].present?
  		@posts = Post.entitled(params[:q])
  	else
  		@posts = Post.all
  	end
  		
  end

  def show
  	@post = Post.find(params[:id])
    @comment = Comment.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def destroy
    # implement destroying a post
  end

  def update
  	@post = Post.find(params[:id])
  	if @post.update(post_params)
  		redirect_to root_path
  	else
  		render :edit
  	end
  end
  
  def new
    @post = Post.new
  end

  def search
  	@posts = Post.entitled(params[:q])

  	render 'index'
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  
  def post_params
    params.require(:post).permit(:title, :user_id, :content, :category)
  end


end
