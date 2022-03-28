require 'rails_helper'

describe 'Quotes' do
  let(:option)   { 'quote' }
  let(:service)  { SwansonService.new(option) }
  let(:response) { service.quote }
  let(:thought)  { 'Fish, for sport only, not for meat. Fish meat is practically a vegetable.' }
  let(:quote)    { Quote.last }
  let(:user)     { User.find_or_create_by(id: 1, ip_address: '123')}

  it 'shows quote on index' do
    VCR.use_cassette('ron_thoughts_casette') do
      visit quotes_path

      expect(page).to have_content(thought)
    end
  end

  it 'user can rate a quote' do
    VCR.use_cassette('ron_thoughts_casette') do
      visit quotes_path

      first(:link, "Rate Quote").click
      expect(current_path).to eq(new_quote_rating_path(quote))

      expect(page).to have_content(thought)

      #stub out service call since I don't care about new quote showing up on redirect
      allow_any_instance_of(SwansonService).to receive(:quote).and_return(thought)
      first(:button, "Create Rating").click
      expect(Rating.count).to eq(1)
      expect(current_path).to eq(quotes_path)
    end
  end
end
