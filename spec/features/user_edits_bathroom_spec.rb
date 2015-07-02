require 'rails_helper'

# Acceptance Criteria
# [x] I can only see the edit button if I own the bathroom
# [x] There is an edit button on the show page
# [x] I can click the button to edit my bathroom
# [x] I am linked to a page to edit my selected bathroom
# [x] I am notified when I edit my bathroom

feature "As an authenticated user
I want to edit a bathroom
so that bathroom has relevant information" do
  scenario 'User edits a bathroom' do
    @user = FactoryGirl.create(:user)
    @bathroom = FactoryGirl.create(:bathroom, user: @user)
    visit new_user_session_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button "Log in"
    visit bathroom_path(@bathroom)

    expect(page).to have_link("Edit this Bathroom")
    click_link 'Edit this Bathroom'
    fill_in :bathroom_location_name, with: "Ian is weird"
    fill_in :bathroom_street_address, with: "SYKE HES HOT"
    fill_in :bathroom_zip_code, with: "02243"
    fill_in :bathroom_description, with: "Brian's not too shabby either"
    click_button "Edit Bathroom"

    expect(page).to have_content("Ian is weird")
    expect(page).to have_content("SYKE HES HOT")
    expect(page).to have_content("Bathroom Edited")
  end

  scenario 'User incorrectly edits a bathroom' do
    @user = FactoryGirl.create(:user)
    @bathroom = FactoryGirl.create(:bathroom, user: @user)
    visit new_user_session_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button "Log in"
    visit bathroom_path(@bathroom)

    expect(page).to have_link("Edit this Bathroom")
    click_link 'Edit this Bathroom'
    fill_in :bathroom_street_address, with: "SYKE HES HOT"
    fill_in :bathroom_zip_code, with: "02243"
    fill_in :bathroom_description, with: "Brian's not too shabby either"
    click_button "Edit Bathroom"

    expect(page).to have_content(@bathroom.errors.full_messages.first)
  end
end
