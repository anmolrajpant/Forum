class CommentsController < ApplicationController
  def index
    @post = Post.find(params[:post_id])
    @comments= @post.post_comments_path
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
    #@comment.save

    @post = Post.find(params[:post_id])

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
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
