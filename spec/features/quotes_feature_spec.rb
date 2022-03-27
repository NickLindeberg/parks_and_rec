require 'rails_helper'

describe 'Quotes' do
  let(:option)   { 'quote' }
  let(:service)  { SwansonService.new(option) }
  let(:response) { service.quote }
  let(:quote)    { 'Fish, for sport only, not for meat. Fish meat is practically a vegetable.' }

  it 'shows quote on index' do
    VCR.use_cassette('ron_thoughts_casette') do
      visit quotes_path

      expect(page).to have_content(quote)
    end
  end
end
