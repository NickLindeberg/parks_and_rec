require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:ip_address) }
  end

  describe 'Relations' do
    it { should have_many(:ratings) }
  end
end
