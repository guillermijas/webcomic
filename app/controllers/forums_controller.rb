class ForumsController < ApplicationController
  before_action :set_forum, only: [:show, :edit, :update, :destroy]
  before_action :set_comic
  before_action :set_threads, only: :show

  def show
  end

  private

  def set_forum
    @forum = Forum.find(params[:id])
  end

  def set_threads
    @threads = Group.where(forum_id: @forum.id)
  end

  def set_comic
    @comic = Comic.find(params[:comic_id])
  end

  def forum_params
    params.require(:forum).permit(:comic_id, :topic)
  end
end
