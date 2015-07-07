require 'factory_girl'

FactoryGirl.define do

  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
  end

  factory :bathroom do
    user
    rating_average 5.0
    location_name "Starbucks"
    sequence(:street_address) {|n| "#{n} Boylston" }
    zip_code "02116"
    description "Back corner. Key from barista. Watch out for joe."
  end

  factory :review do
    user
    bathroom
    body "Look out for Joe and Joe"
    rating 5
  end
end
