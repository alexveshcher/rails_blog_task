require 'rails_helper'

RSpec.describe Category, type: :model do

  let(:category) { create :category }

  it 'has valid factory' do
    expect(category).to be_valid
  end

  describe 'validations' do
    it { should validate_presence_of :name }

    it 'name is invalid without 2 words with at least 2 letters' do
      category = build_stubbed(:category, name: 'B News')
      expect(category).to_not be_valid

      category = build_stubbed(:category, name: 'Breaking N')
      expect(category).to_not be_valid

      category = build_stubbed(:category, name: 'Breaking N W ')
      expect(category).to_not be_valid
    end

    it 'name is invalid without dot sign' do
      category = build_stubbed(:category, name: 'Breaking News')
      expect(category).to_not be_valid
    end

    it 'name is invalid without if the first word is not capitalized' do
      category = build_stubbed(:category, name: 'breaking News')
      expect(category).to_not be_valid

      category = build_stubbed(:category, name: '.breaking News')
      expect(category).to_not be_valid
    end
  end


end
