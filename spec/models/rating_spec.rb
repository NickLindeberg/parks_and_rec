require 'rails_helper'

RSpec.describe Rating, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:score) }
  end

  describe 'Relations' do
    it { should belong_to(:quote) }
  end

  describe 'average_score' do
    let(:user)      { User.create(ip_address: "1234::1") }
    let(:quote_1)   { Quote.create(thought: "snarky comment") }
    let(:quote_2)   { Quote.create(thought: "fun thing to say") }
    let!(:rating_1) { quote_1.ratings.create(score: 1, user_id: user.id)}
    let!(:rating_2) { quote_1.ratings.create(score: 2, user_id: user.id)}
    let!(:rating_3) { quote_1.ratings.create(score: 5, user_id: user.id)}

    it 'gives and average score for ratings' do
      expect(quote_1.ratings.average_score).to eq(2)
    end

    it 'returns no ratings yet for unrate quotes' do
      expect(quote_2.ratings.average_score).to eq("No Ratings Yet")
    end
  end
end
