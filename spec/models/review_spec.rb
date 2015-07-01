require 'rails_helper'

RSpec.describe Review do
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:bathroom_id) }
  it { should validate_presence_of(:body) }
  it { should validate_presence_of(:rating_id) }
end
