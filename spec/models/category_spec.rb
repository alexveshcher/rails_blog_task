require 'rails_helper'

RSpec.describe Category, type: :model do

  let(:category) { create :category }

  it 'has valid factory' do
    expect(category).to be_valid
  end

end
