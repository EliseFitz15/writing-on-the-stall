require 'rails_helper'

RSpec.describe Bathroom do
  it { should validate_presence_of(:user) }
  it { should validate_presence_of(:location_name) }
  it { should validate_presence_of(:street_address) }
  it { should validate_presence_of(:zip_code) }
  it { should validate_presence_of(:description) }
end
