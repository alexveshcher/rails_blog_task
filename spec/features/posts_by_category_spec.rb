require 'spec_helper'
require 'rails_helper'


RSpec.describe 'Posts by category interaction', type: :feature do

  let(:category) { create(:category) }
  let(:posts) { create_list(:post, 5, category: category ) }


  it 'can read posts of selected category' do
    categories = create_list(:category)
    posts = create_list(:post, category: categories.first)
    visit '/categories'
    find('Show related posts').first.click
    posts.each do |post|
      expect(page).to have_content(post.content)
    end
  end

  it 'can create post' do
    posts
    name = 'Project: Border'
    visit '/categories/1/posts'
    click 'Add post'
    fill_in '[post][name]', with: name

    expect{ click 'Save' }.to change{ Post.count }.by(1)
    expect(page).to have_content(name)
  end

  it 'can update post' do
    posts
    visit '/categories/1/posts'
    find('Edit').first.click
    fill_in '[post][name]', with: name
    expect{ click 'Save' }.to change{ Post.first.name }
  end

  it 'can delete post' do
    posts
    visit '/categories/1/posts'
    expect{ find('Delete').first.click }.to change{ Post.count }.by(-1)
  end



end

