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
    10.times do
      FactoryGirl.create(:bathroom, user: user)
    end
    visit bathrooms_path
    expect(page).to have_content("Bathrooms BA-BAY!")
    expect(page).to have_content(bathroom.location_name)
    expect(page).to have_content("Next")
  end
end
