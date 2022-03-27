require 'rails_helper'

RSpec.describe Rating, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:score) }
  end

  describe 'Relations' do
    it { should belong_to(:quote) }
  end
end
