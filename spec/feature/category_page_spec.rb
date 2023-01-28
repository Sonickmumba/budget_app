require 'rails_helper'

RSpec.describe 'category page', type: :feature do
  describe 'category page' do
    before(:each) do
      @user1 = User.create(name: 'Sonick Mumba', email: 's@gmail.com', password: 'qwerty')

      login_as(@user1)

      visit groups_path
    end

    scenario 'I can see a button Add New Category' do
      expect(page).to have_content 'Add New Category'
      expect(page).to have_content 'Categories'
    end
  end

  describe 'category page' do
    before(:each) do
      @user1 = User.create(name: 'Sonick Mumba', email: 's@gmail.com', password: 'qwerty')

      login_as(@user1)

      visit groups_path

      click_on 'Add New Category'
      fill_in 'Category', with: 'Mac Donalds'
      fill_in 'Url', with: 'https://images.unsplash.com/photo-1638902427911-7cb57511a58b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8bWFjZG9uYWxkc3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'
      click_on 'Add Category'
    end

    scenario 'I can see a Mac Donalds' do
      expect(page).to have_content 'Mac Donalds'
    end

    scenario 'I can see a Mac Donalds' do
      expect(page).to have_content('$0')
    end

    scenario 'I can see a button Add New Category' do
      expect(page).to have_content 'Sign Out'
    end
  end
end
