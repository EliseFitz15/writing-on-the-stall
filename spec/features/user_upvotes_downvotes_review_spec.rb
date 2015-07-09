require "rails_helper"

# Acceptance Criteria
# [√] I want to be able to see an upvote option
# [√] I want to be able to see a downvote option

feature "As a user
I want to upvote a review
So that I can inform others of the quality of the review" do
  scenario "user views upvote and downvote options" do
    user = FactoryGirl.create(:user)
    bathroom = FactoryGirl.create(:bathroom)
    FactoryGirl.create(:review, bathroom: bathroom)

    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button "Log in"

    visit bathroom_path(bathroom)
    expect(page).to have_content("1")
    expect(page).to have_content("-1")
  end
end
