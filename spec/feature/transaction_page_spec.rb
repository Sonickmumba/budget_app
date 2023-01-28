require 'rails_helper'

RSpec.describe 'Transaction page', type: :feature do
  describe 'Transaction page' do
    before(:each) do
      @user1 = User.create(name: 'Sonick Mumba', email: 's@gmail.com', password: 'qwerty')

      login_as(@user1)

      visit groups_path

      click_on 'Add New Category'
      fill_in 'Category', with: 'Mac Donalds'
      fill_in 'Url', with: 'https://images.unsplash.com/photo-1638902427911-7cb57511a58b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8bWFjZG9uYWxkc3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'
      click_on 'Add Category'
      click_on 'Mac Donalds'
    end

    scenario 'I can see a Mac Donalds' do
      expect(page).to have_content 'Mac Donalds'
    end

    scenario 'I can see Transactions' do
      expect(page).to have_content('Transactions')
    end

    scenario 'I can see a button Add New Transation' do
      expect(page).to have_content 'Add New Transaction'
    end
  end
end
