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
    #@comment.save
    @post = Post.find(params[:post_id])
    @comments = @post.comments.new(save)
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


  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    if @comment.destroy
      redirect_to(:action => :index)
    end

    
  end

  def update
   @post = Post.find(params[:post_id]) 
   @comment = @post.comments.find(params[:id])
   if @comment.update_attributes(save)
    redirect_to(:action => :index)
   end
  end

  def edit
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
  end
  private 
  def save
    params.require(:comment).permit(:description, :name)
  end
end
