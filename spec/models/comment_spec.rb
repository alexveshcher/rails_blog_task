require 'rails_helper'

RSpec.describe Comment, type: :model do

  let(:comment) { create :comment }

  it 'has valid factory' do
    expect(comment).to be_valid
  end

  describe 'validations' do
    it { should validate_presence_of :author }

    it 'author is invalid without 2 words with at least 2 letters' do
      comment = build_stubbed(:comment, author: 'R Smith.')
      expect(comment).to_not be_valid

      comment = build_stubbed(:comment, author: 'Roman S.')
      expect(comment).to_not be_valid

      comment = build_stubbed(:comment, author: 'R Sm D.')
      expect(comment).to_not be_valid

      comment = build_stubbed(:comment, author: 'Roman S.')
      expect(comment).to_not be_valid
    end

    it 'author is invalid without dot sign' do
      comment = build_stubbed(:comment, author: 'Roman Smith')
      expect(comment).to_not be_valid
    end

    it 'author is invalid without if each word is not capitalized' do
      comment = build_stubbed(:comment, author: 'roman Smith.')
      expect(comment).to_not be_valid

      comment = build_stubbed(:comment, author: 'Roman smith.')
      expect(comment).to_not be_valid

      comment = build_stubbed(:comment, author: 'Roman delano Smith.')
      expect(comment).to_not be_valid
    end

    it { should validate_presence_of :content }
  end

end
