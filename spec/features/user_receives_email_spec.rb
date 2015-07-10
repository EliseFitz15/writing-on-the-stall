require 'rails_helper'

# Acceptance Criteria
# [x] I receive an email when someone reviews my bathroom

feature "As a user
I want to get notified via email
when someone reviews my bathroom" do
  scenario "Someone reviews a toilet" do
    user = FactoryGirl.create(:user)
    bathroom = FactoryGirl.create(:bathroom, user: user)

    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button "Log in"

    click_link "Explore Bathrooms"
    click_link bathroom.location_name
    fill_in "Body", with: "Very clean"
    fill_in "Rating", with: 5
    click_button "Submit"

    expect(ActionMailer::Base.deliveries.count).to eq(1)
  end
end
