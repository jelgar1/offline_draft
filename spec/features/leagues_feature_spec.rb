require 'rails_helper'

feature 'leagues' do
  context 'no leagues have been added' do
    scenario 'should display a prompt to add a league' do
      visit '/leagues'
      expect(page).to have_content 'No leagues yet'
      expect(page).to have_link 'Add a league'
    end
  end
  context 'leagues have been added' do
    before do
      League.create(name: 'Turkcell')
    end

    scenario 'display leagues' do
      visit '/leagues'
      expect(page).to have_content('Turkcell')
      expect(page).not_to have_content('No leagues yet')
    end
  end
  context 'creating leagues' do
    scenario 'prompts user to fill out a form, then displays the new league' do
      visit '/leagues'
      click_link 'Add a league'
      fill_in 'Name', with: 'Turkcell'
      fill_in 'Teams', with: '8'
      click_button 'Create League'
      expect(page).to have_content 'Turkcell'
      expect(current_path).to eq '/leagues'
    end
  end
end
