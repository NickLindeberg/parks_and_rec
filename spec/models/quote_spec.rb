require 'rails_helper'

RSpec.describe Quote, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:thought) }
  end

  describe 'Relations' do
    it { should have_many(:ratings) }
  end

end
