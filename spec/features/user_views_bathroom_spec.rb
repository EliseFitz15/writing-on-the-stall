require 'rails_helper'

# Acceptance Criteria
# [x] I can click on a bathroom from the index page
# [x] There is a show page for a bathroom
# [x] I can see details about the bathroom on the show page

feature "As an authenticated user
I want to view the details about a bathroom
So that I can get more information about it" do
  scenario 'User clicks on a bathroom location
  and is brought to the bathroom show page' do
    @user = FactoryGirl.create(:user)
    visit new_user_session_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button "Log in"
    @bathroom = FactoryGirl.create(:bathroom, user: @user)
    visit bathrooms_path
    click_link @bathroom.location_name

    expect(page).to have_content(@bathroom.rating_average)
    expect(page).to have_content(@bathroom.location_name)
    expect(page).to have_content(@bathroom.street_address)
    expect(page).to have_content(@bathroom.zip_code)
    expect(page).to have_content(@bathroom.description)
  end
end
