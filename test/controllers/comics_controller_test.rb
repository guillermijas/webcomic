require 'test_helper'

class ComicsControllerTest < ActionDispatch::IntegrationTest

  setup do
    @comic = comics(:one)
    @user = users(:ivan)
    sign_in(@user)
  end

  test "should get index" do
    get comics_url
    assert_response :success
  end

  test "should get new" do
    get new_comic_url
    assert_response :success
  end

  test "should create comic" do
    assert_difference('Comic.count') do
      post comics_url, params: {
          comic: {
              average_rating: @comic.average_rating, category: @comic.category, price: @comic.price,
              title: @comic.title
          }
      }
    end
    assert_equal(@comic.id, Comic.find(@comic.id).id)
    assert_equal(@user.id, Comic.last.user_id)
    assert_not_nil(Forum.find_by(comic: Comic.last, topic: 'General'))
    assert_not_nil(Forum.find_by(comic: Comic.last, topic: 'Speculate'))
    assert_redirected_to comic_path(Comic.last)
  end

  test "should update comic" do
    patch comic_url(@comic), params: {
        comic: {
            average_rating: @comic.average_rating, category: @comic.category, price: @comic.price, title: @comic.title,
            user_id: @comic.user_id
        }
    }
    assert_redirected_to comic_url(@comic)
  end

  test "should destroy comic" do
    assert_difference('Comic.count', -1) do
      delete comic_url(@comic)
    end

    assert_redirected_to comics_url
  end
 end
