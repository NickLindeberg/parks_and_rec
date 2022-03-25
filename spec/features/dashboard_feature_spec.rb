require 'rails_helper'

describe 'Dashboard' do
  it 'shows basic dashboard information' do
    visit '/'

    expect(page).to have_content('Something Funny Goes Here')
  end
end
