require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
  end

  # factory :bathroom do
  #   user
  #   rating_average 5.0
  #   location_name "Carl's"
  #   street_address "12 Twelve lane"
  #   zip_code "90210"
  #   description "Upstair to the left(twice), pay joe 3 bucks."
  # end
end
