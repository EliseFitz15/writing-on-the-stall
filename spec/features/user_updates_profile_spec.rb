require 'rails_helper'

# Acceptence Criteria
# [✓] I can navigate to an update page for my profile
# [✓] My profile is populated with accurate information

feature "As an authenticated user
I want to update my information
So that I can keep my profile up to date" do
  scenario "authenticated user clinks link to update information" do
    user = FactoryGirl.create(:user)
    email_update = 'newuseremail@email.com'
    visit '/'
    click_link("Sign In")
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button('Log in')
    click_link 'Edit Profile'
    expect(page).to have_content("Edit User")
    fill_in 'Email', with: email_update
    fill_in 'Current password', with: user.password
    click_button 'Update'
    expect(page).to have_content("Your account has been updated successfully.")
    click_link 'Edit Profile'
    find_field('Email').value.should eq email_update
  end
end
