require 'spec_helper'
require 'rails_helper'

RSpec.describe 'Blogger interaction', type: :feature do

  it 'it can visit root page' do
    visit ''
    expect(page).to have_content
  end

end