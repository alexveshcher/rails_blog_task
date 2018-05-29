require 'spec_helper'
require 'rails_helper'


RSpec.describe 'Post interaction', type: :feature do

  let(:post) { create :post }

  it 'can visit post' do
    post
    visit '/posts/1'
    expect(page).to have_content(post.name)
  end

  it 'can read comments' do
    comments = create_list(:comment, 5, post: post)
    visit '/posts/1'
    comments.each do |comment|
      expect(page).to have_content(comment.content)
    end
  end

  it 'can add comment to post' do
    post
    author = 'Roman'
    content = 'The post is mine'
    visit '/posts/1'
    fill_in '[comment][author]', with: author
    fill_in '[comment][content]', with: content
    expect{ click 'Send comment' }.to change{ Comment.count }.by(1)
  end

  it 'can add comment to post' do
    post
    author = 'Roman'
    content = 'The post is mine'
    visit '/posts/1'
    fill_in '[comment][author]', with: author
    fill_in '[comment][content]', with: content
    expect{ click 'Send comment' }.to change{ Comment.count }.by(1)
  end




end

