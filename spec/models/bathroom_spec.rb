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
  describe '.avg_rating' do
    context 'there are reviews with ratings' do
      it 'should calulate average rating for bathroom' do
        bathroom = FactoryGirl.create(:bathroom)
        FactoryGirl.create(:review, bathroom: bathroom)
        FactoryGirl.create(:review, rating: 3, bathroom: bathroom)
        expect(bathroom.avg_rating).to eq(4.0)
      end
    end
    context 'there are no reviews or ratings for this bathroom' do
      it 'should return 0.0 for the average rating of the bathroom' do
        bathroom = FactoryGirl.create(:bathroom)
        expect(bathroom.avg_rating).to eq(0.0)
      end
    end
  end
end
