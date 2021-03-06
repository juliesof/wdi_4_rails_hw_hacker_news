class CommentsController < ApplicationController
#   before_action :authenticate_user!

  def index
    @comments = Comment.all
  end

  def new
    @comment = Comment.new #placeholder for the form
    @article = Article.find(params[:article_id])
  end

  def create
    @comment = Comment.new(comment_params)
    # @comment.user = current_user

    if @comment.save
      redirect_to article_comments_path, notice: 'Comment posted!'
    else
      flash.now[:alert] = @comment.errors.full_messages.join(', ')
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
