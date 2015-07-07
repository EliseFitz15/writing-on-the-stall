require 'rails_helper'

RSpec.describe Review do
  it { should belong_to(:user) }
  it { should belong_to(:bathroom) }
  it { should validate_presence_of(:body) }
  it { should validate_presence_of(:rating) }
end
