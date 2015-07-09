require 'rails_helper'

# Acceptance Criteria
# [] Admin views a list of users

feature "As an Admin
I want to view a list of users
so I can manage users" do
    let(:admin) { FactoryGirl.create(:user, role: 'admin') }
    let!(:user) { FactoryGirl.create(:user) }
  scenario 'admin visits users index' do

    login_as(admin)
    visit '/admin/users'
    expect(page).to have_content(user.email)
  end

end
