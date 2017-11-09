require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @comic = comics(:one)
    @user = users(:ivan)
    @forum = forums(:one)
    @group = groups(:one)
    @comments = comments(:one)
    sign_in(@user)
  end


  # test "should get new" do
  #   get new_comic_forum_group_comment_url(@comic.id, @forum.id, @group.id)
  #   assert_response :success
  # end

  # test "should create comment" do
  #   assert_difference('Comment.count') do
  #     post comic_forum_group_comments_url(@comic,@forum,@group), params: {
  #         comment: {
  #             body: @comment.body
  #         }
  #     }
  #   end

    # assert_redirected_to comic_forum_group_comment_url(Comment.last)
  # end
#
#   test "should show comment" do
#     get comment_url(@comment)
#     assert_response :success
#   end
#
#   test "should get edit" do
#     get edit_comment_url(@comment)
#     assert_response :success
#   end
#
#   test "should update comment" do
#     patch comment_url(@comment), params: { comment: { body: @comment.body, group_id: @comment.group_id, user_id: @comment.user_id } }
#     assert_redirected_to comment_url(@comment)
#   end
#
#   test "should destroy comment" do
#     assert_difference('Comment.count', -1) do
#       delete comment_url(@comment)
#     end
#
#     assert_redirected_to comments_url
#   end
end
