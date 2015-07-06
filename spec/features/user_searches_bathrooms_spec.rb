require 'rails_helper'

feature 'As a user
I want the ability to search for bathrooms
So I can search for bathrooms by location/rating' do
  scenario 'user fills in zip code and sees all bathrooms in area' do
    user = FactoryGirl.create(:user)
    bathroom = FactoryGirl.create(:bathroom, user: user)
    visit bathrooms_path

    fill_in :search, with: bathroom.zip_code
    click_button "Search"

    expect(page).to have_content("bathroom(s) found in this area")
    expect(page).to have_content("Starbucks")
  end
end
