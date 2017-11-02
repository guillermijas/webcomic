class CommentsController < ApplicationController
  before_action :set_comment, only: :destroy
  before_action :set_parent_resources

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.group_id = @thread.id
    respond_to do |format|
      if @comment.save!
        format.html { redirect_to comic_forum_group_path(@comic, @forum, @thread), notice: 'Comment was successfully created.' }
      else
        format.html { redirect_to comic_forum_group_path(@comic, @forum, @thread) }
      end
    end
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_url, notice: 'Comment was successfully destroyed.' }
    end
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end

  def set_parent_resources
    @comic = Comic.find(params[:comic_id])
    @forum = Forum.find(params[:forum_id])
    @thread = Group.find(params[:group_id])
  end
end
