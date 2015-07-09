require "rails_helper"

# Acceptance Criteria
# [] Admin sees list of bathrooms with reviews
# [] Admin can see buttons to delete reviews
# [] Admin can delete reviews and they are removed

feature "As an Admin
I want to delete a review
so that the review no longer exits on the site" do
  let(:admin) { FactoryGirl.create(:user, role: 'admin') }
  let!(:user) { FactoryGirl.create(:user) }
  let!(:bathroom) { FactoryGirl.create(:bathroom, user: user) }
  let!(:review) { FactoryGirl.create(:review, bathroom: bathroom, user: user) }

  scenario "admin deletes review" do
    visit new_user_session_path
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Log in'

    visit admin_bathroom_path(bathroom)
    expect(page).to have_content(bathroom.location_name)
    expect(page).to have_content(review.body)
    click_button("Delete Review", match: :first)
    expect(page).to_not have_content(review.body)
  end
end
