require "rails_helper"

# Acceptance Criteria
# [√] I want to be on the Bathrooms details page and see form to write a review
# [√] I want to write a review for a specific bathroom
# [√] I want to see it on the bathroom details page

feature "As a user
I want to write a review
So that I can inform others of the quality of the bathroom" do
  scenario "user writes a review and sees on page" do
    user = FactoryGirl.create(:user)
    bathroom = FactoryGirl.create(:bathroom)
    FactoryGirl.create(:review, bathroom: bathroom)

    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button "Log in"

    click_link "Explore Bathrooms"
    click_link bathroom.location_name
    fill_in "Body", with: "Not very clean"
    fill_in "Rating", with: 1
    click_button "Submit"
    expect(page).to have_content("Not very clean")
    expect(page).to have_content(1)
    expect(page).to have_content(3.0)
  end
  scenario "user writes an invalid review and sees error on page" do
    user = FactoryGirl.create(:user)
    bathroom = FactoryGirl.create(:bathroom)

    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button "Log in"

    click_link "Explore Bathrooms"
    click_link bathroom.location_name
    fill_in "Body", with: "Very clean"
    fill_in "Rating", with: 9
    click_button "Submit"
    expect(page).to have_content("Rating must be less than or equal to 5")
    expect(page).to_not have_content("Very clean")
  end
end
