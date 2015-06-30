require 'rails_helper'

# Acceptence Criteria
# [ x] There is a new page
# [ x] I can submit a form to add a new bathroom
# [ x] I am notified when I create a bathroom
# [ x] I am notified when form is filled out incorrectly

feature "As an authenticated user
I want to add an item
So that others can review it" do
  scenario 'User fills in bathroom form and submits' do
    @user = FactoryGirl.create(:user)
    visit new_user_session_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button "Log in"

    visit bathrooms_path
    click_link 'Create New Bathroom'
    fill_in :bathroom_location_name, with: "McDonald's"
    fill_in :bathroom_street_address, with: "12 Junkyard lane"
    fill_in :bathroom_zip_code, with: "02443"
    fill_in :bathroom_description, with: "Downstairs, dark path, joe's waiting.."
    click_button "Create Bathroom"

    expect(page).to have_content("McDonald's")
    expect(page).to have_content("12 Junkyard lane")
  end
end
