require 'rails_helper'

# Acceptance criteria
# [√] I must be logged in
# [√] I must be on the bathrooms details page
# [√] I can see a list of reviews ordered by most recent review

feature 'As a user
  I want to view all reviews on a bathroom
  So that I can decide which bathroom to visit' do
  scenario 'user visits bathroom details page
    and sees reviews for that bathroom' do
    user = FactoryGirl.create(:user)
    bathroom = FactoryGirl.create(:bathroom, user: user)
    review = FactoryGirl.create(:review, user: user, bathroom: bathroom)
    10.times do
      FactoryGirl.create(:review, user: user, bathroom: bathroom)
    end

    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button "Log in"

    click_link 'Explore Bathrooms'
    click_link bathroom.location_name

    expect(page).to have_content 'Reviews'
    expect(page).to have_content(bathroom.location_name)
    expect(page).to have_content(review.body)
    expect(page).to have_content(review.rating)
    expect(page).to have_content(review.created_at)
    expect(page).to have_content("Next")
  end
end
