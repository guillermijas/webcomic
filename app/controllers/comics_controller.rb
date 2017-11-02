class ComicsController < ApplicationController
  before_action :set_comic, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :set_limit, only: [:index, :free, :top_rated, :favourites]

  # GET /comics
  # GET /comics.json
  def index
    @q = Comic.ransack(params[:q])

    if params[:title].nil?
      @q.sorts = 'created_at desc' if @q.sorts.empty?
      @comics = @q.result.paginate(page: params[:page], per_page: @lmt)
    else
      @comics = @q.result.where('title LIKE ?', "%#{params[:title]}%").order(:title).paginate(page: params[:page], per_page: @lmt)
    end
  end

  # GET /comics/1
  # GET /comics/1.json
  def show
  end

  # GET /comics/new
  def new
    @comic = Comic.new
  end

  # GET /comics/1/edit
  def edit
  end

  # POST /comics
  # POST /comics.json
  def create
    @comic = Comic.new(comic_params)

    respond_to do |format|
      if @comic.save
        format.html {redirect_to @comic, notice: 'Comic was successfully created.'}
        format.json {render :show, status: :created, location: @comic}
      else
        format.html {render :new}
        format.json {render json: @comic.errors, status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /comics/1
  # PATCH/PUT /comics/1.json
  def update
    respond_to do |format|
      if @comic.update(comic_params)
        format.html {redirect_to @comic, notice: 'Comic was successfully updated.'}
        format.json {render :show, status: :ok, location: @comic}
      else
        format.html {render :edit}
        format.json {render json: @comic.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /comics/1
  # DELETE /comics/1.json
  def destroy
    @comic.destroy
    respond_to do |format|
      format.html {redirect_to comics_url, notice: 'Comic was successfully destroyed.'}
      format.json {head :no_content}
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

  private
  def set_limit
    @q = Comic.ransack(params[:q])
    @lmt = 10
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_comic
    @comic = Comic.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def comic_params
    params.require(:comic).permit(:user_id, :title, :price, :category, :average_rating, :cover)
  end
end
