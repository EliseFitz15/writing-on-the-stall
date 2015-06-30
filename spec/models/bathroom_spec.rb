require 'rails_helper'
User.create!(
  email: "email@email.com",
  encrypted_password: "password",
  password: "password"
  )
Bathroom.new(
  user_id: 1,
  rating_average: 3,
  location_name: "Starbucks",
  street_address: "62 Boylston",
  zip_code: 02116,
  description: "This is the best bathroom ever!"
  )

RSpec.describe Bathroom do
  it { should validate_presence_of(:user) }
  it { should validate_presence_of(:location_name) }
  it { should validate_presence_of(:street_address) }
  it { should validate_presence_of(:zip_code) }
  it { should validate_presence_of(:description) }
end
