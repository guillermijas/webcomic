require 'test_helper'

class PublicationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @comic = comics(:one)
    @user = users(:ivan)
    @publication = publications(:one)
    sign_in(@user)
  end

# test "should get index" do
#   get comic_publications_url(@comic)
#   assert_response :success
# end

  test "should get new" do
    get new_comic_publication_url(@comic.id)
    assert_response :success
  end

  test "should create publication" do
    assert_difference('Publication.count') do
      post comic_publications_url(@comic.id), params: {
          publication: { free: @publication.free, page: @publication.page,
                         comment: @publication.comment
          }
      }
  end
    assert_equal(@publication.id, Publication.find(@publication.id).id)
    assert_equal(@user.id, Publication.last.comic.user.id)
    assert_redirected_to comic_publications_path(Comic.last)
  end

  test "should show publication" do
    get new_comic_publication_url(@comic)
    assert_response :success
  end

  # test "should destroy publication" do
  #   assert_difference('Publication.count', -1) do
  #     delete comic_publication_url(@publication)
  #   end
  #
  #   # assert_redirected_to publications_url
  # end
end
