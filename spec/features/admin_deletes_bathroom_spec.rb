require "rails_helper"

# Acceptance Criteria
# [] Admin sees list of bathrooms and buttons to delete them
# [] Admin can delete bathrooms

feature "As an Admin
I want to delete a bathroom
so that the bathroom no longer exits on the site" do
let(:admin) { FactoryGirl.create(:user, role: 'admin') }
let!(:user) { FactoryGirl.create(:user) }
let!(:bathroom) { FactoryGirl.create(:bathroom, user: user) }
  scenario "admin deletes bathroom" do
    visit new_user_session_path
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Log in'

    visit '/admin/bathrooms'
    expect(page).to have_content(bathroom.location_name)
    click_button("Delete", match: :first)
    expect(page).to_not have_content(bathroom.location_name)
  end
end
