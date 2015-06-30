require 'rails_helper'

# Acceptence Criteria
# [ ] There is an index page
# [ ] I can see a list of bathrooms

feature "As a user
I want to see a list of nearby bathrooms
So I can find a good bathroom when needed." do
  scenario "User views list of bathrooms" do
    user = User.create!(
      email: "other@email.com",
      encrypted_password: "password",
      password: "password"
      )
    bathroom = Bathroom.create!(
      user: user,
      rating_average: 5.0,
      location_name: "Starbucks",
      street_address: "62 Boylston",
      zip_code: "02116",
      description: "Back corner. Key from barista. Watch out for joe."
      )
    visit bathrooms_path
    expect(page).to have_content("List of Bathrooms")
    expect(page).to have_content(bathroom.location_name)
  end
end
