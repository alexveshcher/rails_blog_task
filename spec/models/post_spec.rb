require 'rails_helper'

RSpec.describe Post, type: :model do

  let(:post) { create :post }

  it 'has valid factory' do
    expect(post).to be_valid
  end

  describe 'validations' do
    it { should validate_presence_of :name }

    it 'name is invalid without 2 words with at least 2 letters' do
      post = build_stubbed(:post, name: 'B News.')
      expect(post).to_not be_valid

      post = build_stubbed(:post, name: 'Breaking N.')
      expect(post).to_not be_valid

      post = build_stubbed(:post, name: 'Breaking N W.')
      expect(post).to_not be_valid
    end

    it 'name is invalid without dot sign' do
      post = build_stubbed(:post, name: 'Breaking News')
      expect(post).to_not be_valid
    end

    it 'name is invalid without if the first word is not capitalized' do
      post = build_stubbed(:post, name: 'breaking News.')
      expect(post).to_not be_valid

      post = build_stubbed(:post, name: '.breaking News')
      expect(post).to_not be_valid
    end
  end

end
