class ComicsController < ApplicationController
  before_action :set_comic, only: [:show, :edit, :update, :destroy, :save_favourite]
  before_action :authenticate_user!
  before_action :set_limit, only: [:index, :free, :top_rated, :favourites]

  def index
    @q = Comic.ransack(params[:q])

    if params[:title].nil?
      @q.sorts = 'created_at desc' if @q.sorts.empty?
      @comics = @q.result.paginate(page: params[:page], per_page: @lmt)
    else
      @comics = @q.result.where('title LIKE ?', "%#{params[:title]}%").order(:title).paginate(page: params[:page], per_page: @lmt)
    end
  end

  def show
    @q = Comic.ransack(params[:q])
  end

  def new
    @q = Comic.ransack(params[:q])
    @comic = Comic.new
  end

  def edit
  end


  def create
    @comic = Comic.new(comic_params)
    @comic.user = current_user
    @comic.price = 0 if @comic.price.nil?
    respond_to do |format|
      if @comic.save
        format.html { redirect_to @comic }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @comic.update(comic_params)
        format.html { redirect_to @comic}
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @comic.destroy
    respond_to do |format|
      format.html {redirect_to comics_url, notice: 'Comic was successfully destroyed.'}
    end
  end

  def top_rated
    @comics = @q.result.order(:average_rating).paginate(page: params[:page], per_page: @lmt)
  end

  def free
    @comics = Comic.where('price = 0.0').paginate(page: params[:page], per_page: @lmt)
  end

  def favourites
    @comics = Comic.all.order(:title).paginate(page: params[:page], per_page: @lmt)
  end

  def save_favourite
    redirect_to @comic
  end
  private

  def set_limit
    @q = Comic.ransack(params[:q])
    @lmt = 10
  end

  def set_comic
    @comic = Comic.find(params[:id])
  end

  def comic_params
    params.require(:comic).permit(:title, :price, :category, :synopsis, :cover)
  end
end
