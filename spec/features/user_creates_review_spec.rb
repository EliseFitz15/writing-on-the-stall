require "rails_helper"

#Acceptance Criteria
#[ ] I want to be on the Bathrooms details page and see form to write a review
#[ ] I want to write a review for a specific bathroom
#[ ] I want to see it on the bathroom details page

feature "As a user
I want to write a review
So that I can inform others of the quality of the bathroom" do
  scenario "user writes a review and sees on page" do
    @user = FactoryGirl.create(:user)
    @bathroom = Bathroom.create!(
      user: @user,
      rating_average: 5.0,
      location_name: "Starbucks",
      street_address: "62 Boylston",
      zip_code: "02116",
      description: "Back corner. Key from barista. Watch out for joe."
      )

      visit new_user_session_path
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      click_button "Log in"

      click_link "Check out bathrooms"
      click_link @bathroom.location_name
      fill_in "Body", with: "Very clean"
      fill_in "Rating", with: 5
      click_button "Submit"
      expect(page).to have_content("Very Clean")
      expect(page).to have_content(5)
  end
end
