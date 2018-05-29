require 'spec_helper'
require 'rails_helper'


RSpec.describe 'Categories interaction', type: :feature do

  let(:categories) { create_list(:category, 5) }

  it 'can read list of categories' do
    visit '/caterogies'
    categories.each do |category|
      expect(page).to have_content(category.name)
    end
  end

  it 'can create category' do
    name = 'Urban'
    description = 'How can we improve living in our cities'
    visit '/categories'
    click 'Add category'
    fill_in '[category][name]', with: name
    fill_in '[category][description]', with: description
    expect{ click 'Save' }.to change{ Category.count }.by(1)
    expect(page).to have_content(name)
    expect(page).to have_content(description)
  end

  it 'can update category' do
    categories
    name = 'Urban'
    description = 'How can we improve living in our cities'
    visit '/categories'
    find('Edit').first.click
    fill_in '[category][name]', with: name
    fill_in '[category][description]', with: description
    expect{ click 'Save' }.to change{ Category.first.name }

  end

  it 'can delete category' do
    create(:category)
    visit '/categories'
    expect{ click 'Delete' }.to change{ Category.count }.by(-1)
  end




end

