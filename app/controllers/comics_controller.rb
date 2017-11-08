class ComicsController < ApplicationController
  before_action :set_comic, only: [:show, :edit, :update, :destroy, :save_favourite, :pay_comic]
  before_action :authenticate_user!
  before_action :set_limit, only: [:index, :free, :my_comics, :favourites]

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
    @forums = Forum.where(comic_id: @comic.id)
    @is_fav = Favourite.where(user_id: current_user.id, comic_id: @comic.id).first.present?

    if Payment.where(comic_id: @comic).where(user_id: current_user).count > 0
      @publications = @comic.publications
    else
      @publications = @comic.publications.where(free: true)
    end
  end

  def new
    @q = Comic.ransack(params[:q])
    @comic = Comic.new
  end

  def edit
  end


  def create
    @q = Comic.ransack(params[:q])
    @comic = Comic.new(comic_params)
    @comic.user = current_user
    @comic.price = 0 if @comic.price.nil?
    respond_to do |format|
      if @comic.save
        Forum.create(comic_id: @comic.id, topic: 'General')
        Forum.create(comic_id: @comic.id, topic: 'Speculate')
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

  def my_comics
    @comics = @q.result.where(user_id: current_user).paginate(page: params[:page], per_page: @lmt)
  end

  def free
    @comics = Comic.where('price = 0.0').paginate(page: params[:page], per_page: @lmt)
  end

  def favourites
    favs = Favourite.where(user_id: current_user.id).pluck(:comic_id)
    @comics = Comic.where(id: favs)
  end

  def save_favourite
    @comic = Comic.find(params[:id])
    Favourite.create(comic_id: @comic.id, user_id: current_user.id)

    redirect_to @comic
  end

  def delete_favourite
    @comic = Comic.find(params[:id])
    Favourite.where(user_id: current_user.id, comic_id: @comic.id).first.destroy

    redirect_to @comic
  end

  def pay_premium
    User.find(current_user.id).update(premium_until: 1.month.from_now)
    redirect_to 'https://www.paypal.com/es/signin'
  end

  def pay_comic
    Payment.create(user_id: current_user.id, comic_id: @comic.id)
    redirect_to 'https://www.paypal.com/es/signin'
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
