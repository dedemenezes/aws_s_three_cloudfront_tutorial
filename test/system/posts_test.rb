require "application_system_test_case"

class PostsTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit root_path

    assert_selector "h1", text: "DedevLab Thoughts"
  end

  test 'creating new post' do
    visit root_path
    assert_selector "h1", text: "DedevLab Thoughts"
    assert_equal(0, Post.count)

    click_on 'Leave your thoughts'
    fill_in 'Title', with: '[TITLE]New post from test'
    fill_in 'Content', with: '[CONTENT] New post from test filling in content as needed'
    click_on 'Create Post'
    assert_equal(1, Post.count)
    debugger

  end
end
