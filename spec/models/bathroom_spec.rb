require 'rails_helper'

RSpec.describe Bathroom do
  it { should validate_presence_of(:user) }
  it { should validate_presence_of(:location_name) }
  it { should validate_presence_of(:street_address) }
  it { should validate_presence_of(:zip_code) }
  it { should validate_presence_of(:description) }

  context 'when search method called on bathroom' do
    describe '.search' do
      it 'should search zip codes' do
        expect(Bathroom.search("02116")).to eq
        Bathroom.where("zip_code = ?", "02116")
      end
    end
  end
end
