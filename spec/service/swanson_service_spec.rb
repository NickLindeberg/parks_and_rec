require 'rails_helper'

describe 'Swanson Service' do
  let(:option)   { 'quote' }
  let(:service)  { SwansonService.new(option) }
  let(:response) { service.quote }
  let(:quote)    { 'Fish, for sport only, not for meat. Fish meat is practically a vegetable.' }

  it 'Gets a funny quote from Ron' do
    VCR.use_cassette('ron_thoughts_casette') do
      expect(service).to be_an_instance_of(SwansonService)
      expect(response.body).to be_a(String)
      expect(response.code).to be(200)
      expect(response.body).to include(quote)
    end
  end
end
