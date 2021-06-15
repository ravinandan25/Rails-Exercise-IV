require "test_helper"

class BlogAppsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @blog_app = blog_apps(:one)
  end

  test "should get index" do
    get blog_apps_url
    assert_response :success
  end

  test "should get new" do
    get new_blog_app_url
    assert_response :success
  end

  test "should create blog_app" do
    assert_difference('BlogApp.count') do
      post blog_apps_url, params: { blog_app: { author: @blog_app.author, body: @blog_app.body, title: @blog_app.title } }
    end

    assert_redirected_to blog_app_url(BlogApp.last)
  end

  test "should show blog_app" do
    get blog_app_url(@blog_app)
    assert_response :success
  end

  test "should get edit" do
    get edit_blog_app_url(@blog_app)
    assert_response :success
  end

  test "should update blog_app" do
    patch blog_app_url(@blog_app), params: { blog_app: { author: @blog_app.author, body: @blog_app.body, title: @blog_app.title } }
    assert_redirected_to blog_app_url(@blog_app)
  end

  test "should destroy blog_app" do
    assert_difference('BlogApp.count', -1) do
      delete blog_app_url(@blog_app)
    end

    assert_redirected_to blog_apps_url
  end
end
