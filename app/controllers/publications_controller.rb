class PublicationsController < ApplicationController
  before_action :set_publication, only: [:show, :edit, :update, :destroy]
  before_action :set_comic

  def index
    if @comic.publications.empty?
      redirect_to new_comic_publication_path
    else
      redirect_to comic_publication_path(@comic, @comic.publications.first)
    end
  end


  def show
    @prev = @publication.previous
    @next = @publication.next
  end

  def new
    @publication = Publication.new
  end

  def edit
  end

  def create
    @publication = Publication.new(publication_params)
    @publication.comic = @comic
    respond_to do |format|
      if @publication.save
        format.html { redirect_to comic_publications_path(@comic), notice: 'Publication was successfully created.' }
        format.json { render :show, status: :created, location: @publication }
      else
        format.html { render :new }
        format.json { render json: @publication.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @publication.destroy
    respond_to do |format|
      format.html { redirect_to publications_url, notice: 'Publication was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_publication
    @publication = Publication.find(params[:id])
  end

  def publication_params
    params.require(:publication).permit(:attachment, :free, :comment)
  end

  def set_comic
    @comic = Comic.find(params[:comic_id])
    @q = Comic.ransack(params[:q])
  end
end
