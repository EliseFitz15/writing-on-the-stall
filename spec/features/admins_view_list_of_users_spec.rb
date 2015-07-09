require 'rails_helper'

# Acceptance Criteria
# [] Admin views a list of users

feature "As an Admin
I want to view a list of users
so I can manage users" do
    let(:admin) { FactoryGirl.create(:user, role: 'admin') }
    let!(:user) { FactoryGirl.create(:user) }
  scenario 'admin visits users index' do

    visit new_user_session_path
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Log in'

    visit '/admin/users'
    expect(page).to have_content(user.email)
  end

  scenario 'unauthorized users are redirected' do

    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
    
    visit '/admin/users'
    expect(page).to have_content('not authorized')
    expect(current_path).to eq(root_path)
  end

end
