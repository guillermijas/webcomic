# require 'test_helper'
#
# class ForumsControllerTest < ActionDispatch::IntegrationTest

#   setup do
#     @comic = comics(:one)
#     @user = users(:ivan)
#     @forum = forums(:one)
#     sign_in(@user)
#   end
#
#   test "should get index" do
#     get forums_url
#     assert_response :success
#   end
#
#   test "should get new" do
#     get new_forum_url
#     assert_response :success
#   end
#
#   test "should create forum" do
#     assert_difference('Forum.count') do
#       post forums_url, params: { forum: { comic_id: @forum.comic_id, topic: @forum.topic } }
#     end
#
#     assert_redirected_to forum_url(Forum.last)
#   end
#
#   test "should show forum" do
#     get forum_url(@forum)
#     assert_response :success
#   end
#
#   test "should get edit" do
#     get edit_forum_url(@forum)
#     assert_response :success
#   end
#
#   test "should update forum" do
#     patch forum_url(@forum), params: { forum: { comic_id: @forum.comic_id, topic: @forum.topic } }
#     assert_redirected_to forum_url(@forum)
#   end
#
#   test "should destroy forum" do
#     assert_difference('Forum.count', -1) do
#       delete forum_url(@forum)
#     end
#
#     assert_redirected_to forums_url
#   end
# end
