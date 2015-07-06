require 'rails_helper'

# Acceptance Criteria
# [] There is a delete button on the review
# [] I can click the button to delete a review
# [] I am notified when I delete a review
# [] I can only see the delete button if I own the review

feature "As an authenticated user
I want to delete a review that I have written
so it will no longer be visible" do
  scenario 'User deletes a review' do
    user = FactoryGirl.create(:user)
    bathroom = FactoryGirl.create(:bathroom, user: user)
    FactoryGirl.create(:review, user: user, bathroom: bathroom)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button "Log in"
    visit bathroom_path(bathroom)

    click_button 'Delete this Review'

    expect(page).to have_content("Review Deleted")
  end

  scenario 'User who does not own the review, cannot see the delete button' do
    user = FactoryGirl.create(:user)
    user2 = FactoryGirl.create(:user)
    bathroom = FactoryGirl.create(:bathroom, user: user)
    FactoryGirl.create(:review, user: user, bathroom: bathroom)
    visit new_user_session_path
    fill_in 'Email', with: user2.email
    fill_in 'Password', with: user2.password
    click_button "Log in"
    visit bathroom_path(bathroom)

    expect(page).to_not have_button("Delete this Review")
  end
end
