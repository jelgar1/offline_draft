require 'rails_helper'

feature 'leagues' do
  context 'no leagues have been added' do
    scenario 'should display a prompt to add a league' do
      visit '/leagues'
      expect(page).to have_content 'No leagues yet'
      expect(page).to have_link 'Add a league'
    end
  end
end
