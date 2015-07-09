require "rails_helper"

# Acceptance Criteria
# [√] Admin sees list of users and buttons to delete them
# [√] Admin can delete users

feature "As an Admin
I want to delete users
so that they no longer have an account" do
  let(:admin) { FactoryGirl.create(:user, role: 'admin') }
  let!(:user) { FactoryGirl.create(:user) }
  scenario "admin deletes user" do
    visit new_user_session_path
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Log in'

    visit '/admin/users'
    expect(page).to have_content(user.email)
    click_button("Delete", match: :first)
    expect(page).to_not have_content(user.email)
  end
end
