require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }

  describe '.admin?' do
    context "user is admin" do
      it 'should return true' do
        admin = FactoryGirl.create(:user, role: 'admin')
        expect(admin.admin?).to eq true
      end
    end
    context "user is admin" do
      it 'should return false' do
        user = FactoryGirl.create(:user)
        expect(user.admin?).to eq false
      end
    end
  end
end
