class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]
  before_action :get_comments
  before_action :get_comment
  before_action :get_forum
  before_action :get_comic

  def show
  end

  def new
    @group = Group.new
  end

  def edit
  end

  def create
    @group = Group.new(group_params)

    respond_to do |format|
      if @group.save
        format.html { redirect_to comic_forum_path(@comic, @forum), notice: 'Group was successfully created.' }
        format.json { render :show, status: :created, location: @group }
      else
        format.html { render :new }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @group.destroy
    respond_to do |format|
      format.html { redirect_to groups_url, notice: 'Group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_group
    @thread = Group.find(params[:id])
  end

  def get_comments
    @comments = Comment.where(group_id: @thread)
  end

  def get_comment
    @comment = Comment.new
  end

  def get_forum
    @forum = Forum.find(params[:forum_id])
  end

  def get_comic
    @comic = Comic.find(params[:comic_id])
  end

  def group_params
    params.require(:group).permit(:forum_id, :user_id, :title, :description)
  end
end
