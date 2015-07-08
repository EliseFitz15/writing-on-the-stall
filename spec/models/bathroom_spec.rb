require 'rails_helper'

RSpec.describe Bathroom do
  it { should belong_to(:user) }
  it { should validate_presence_of(:location_name) }
  it { should validate_presence_of(:street_address) }
  it { should validate_numericality_of(:zip_code) }
  it { should validate_length_of(:zip_code) }
  it { should validate_presence_of(:description) }

  describe '.search' do
    context 'there are results' do
      it 'should search zip codes' do
        expect(Bathroom.search("02116")).to eq Bathroom.where(
          "zip_code = ?",
          "02116"
        )
      end
    end
    context "there are no matching results" do
      it 'should search zip codes' do
        expect(Bathroom.search("0211")).to eq []
      end
    end
  end
end
