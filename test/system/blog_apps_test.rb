require "application_system_test_case"

class BlogAppsTest < ApplicationSystemTestCase
  setup do
    @blog_app = blog_apps(:one)
  end

  test "visiting the index" do
    visit blog_apps_url
    assert_selector "h1", text: "Blog Apps"
  end

  test "creating a Blog app" do
    visit blog_apps_url
    click_on "New Blog App"

    fill_in "Author", with: @blog_app.author
    fill_in "Body", with: @blog_app.body
    fill_in "Title", with: @blog_app.title
    click_on "Create Blog app"

    assert_text "Blog app was successfully created"
    click_on "Back"
  end

  test "updating a Blog app" do
    visit blog_apps_url
    click_on "Edit", match: :first

    fill_in "Author", with: @blog_app.author
    fill_in "Body", with: @blog_app.body
    fill_in "Title", with: @blog_app.title
    click_on "Update Blog app"

    assert_text "Blog app was successfully updated"
    click_on "Back"
  end

  test "destroying a Blog app" do
    visit blog_apps_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Blog app was successfully destroyed"
  end
end
