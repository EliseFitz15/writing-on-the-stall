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
    @user = FactoryGirl.create(:user)
    @bathroom = Bathroom.create!(
      user: @user,
      rating_average: 5.0,
      location_name: "Starbucks",
      street_address: "62 Boylston",
      zip_code: "02116",
      description: "Back corner. Key from barista. Watch out for joe."
      )
    @review = Review.create!(
      user_id: @user.id,
      bathroom_id: @bathroom.id,
      body: "Favorite bathroom evahhhhhh",
      rating: 3
      )

    visit new_user_session_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button "Log in"

    click_link 'Check out bathrooms'
    click_link @bathroom.location_name
    
    expect(page).to have_content 'Reviews'
    expect(page).to have_content(@bathroom.location_name)
    expect(page).to have_content(@review.body)
    expect(page).to have_content(@review.rating)
    expect(page).to have_content(@review.created_at)
  end
end
