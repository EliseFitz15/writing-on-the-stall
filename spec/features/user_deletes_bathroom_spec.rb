require 'rails_helper'

# Acceptance Criteria
# [x] There is a delete button on the show page
# [x] I can click the button to delete a bathroom
# [x] I am notified when I delete a bathroom
# [x] I can only see the delete button if I own the bathroom

feature "As an authenticated user
I want to delete a bathroom
and all reviews for that bathroom" do
  scenario 'User deletes a bathroom' do
    user = FactoryGirl.create(:user)
    bathroom = FactoryGirl.create(:bathroom, user: user)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button "Log in"
    visit bathroom_path(bathroom)

    expect(page).to have_button("Delete this Bathroom")
    click_button 'Delete this Bathroom'

    expect(page).to have_content("Bathroom Deleted")
  end

  scenario 'User who does not own the bathroom, cannot see the delete button' do
    user = FactoryGirl.create(:user)
    user2 = FactoryGirl.create(:user)
    bathroom = FactoryGirl.create(:bathroom, user: user)
    visit new_user_session_path
    fill_in 'Email', with: user2.email
    fill_in 'Password', with: user2.password
    click_button "Log in"
    visit bathroom_path(bathroom)

    expect(page).to_not have_button("Delete this Bathroom")
  end
end
