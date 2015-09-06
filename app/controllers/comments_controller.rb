class CommentsController < ApplicationController
  def index
    @post = Post.find(params[:post_id])
    @comments= @post.comments
  end

  def show
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
  end

  def new
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new
  end

  def create
    @posts = Post.find(params[:id])
    @comment = @Post.build_comment()

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def delete
  end

  def destroy
  end

  def update
  end

  def edit
  end
end
