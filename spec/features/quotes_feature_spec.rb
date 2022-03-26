require 'rails_helper'

describe 'Quotes' do
  it 'shows quote on index' do
    VCR.use_cassette('ron_thoughts_casette') do
      visit quotes_path

      expect(page).to have_content('Something Funny Goes Here')
    end
  end
end
