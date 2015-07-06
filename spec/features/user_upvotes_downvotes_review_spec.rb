require "rails_helper"

# Acceptance Criteria
# [√] I want to be able to upvote a review
# [ ] I want to be able to downvote a review
# [ ] I want to see how many upvotes a review has

feature "As a user
I want to upvote a review
So that I can inform others of the quality of the review" do
  scenario "user writes a review and sees on page" do
    user = FactoryGirl.create(:user)
    bathroom = FactoryGirl.create(:bathroom)

    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button "Log in"

    click_link "Check out bathrooms"

  end
end
