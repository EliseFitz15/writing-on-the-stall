require 'rails_helper'

# Acceptance Criteria
# [ ] There is an index page
# [ ] I can see a list of bathrooms

feature "As a user
I want to see a list of nearby bathrooms
So I can find a good bathroom when needed." do
  scenario "User views list of bathrooms" do
    user = FactoryGirl.create(:user)
    bathroom = FactoryGirl.create(:bathroom, user: user)
    visit bathrooms_path
    expect(page).to have_content("List of Bathrooms")
    expect(page).to have_content(bathroom.location_name)
  end
end
