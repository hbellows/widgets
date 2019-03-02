require 'rails_helper'

describe 'Landing Page' do
  context 'A guest visits the landing page and' do
    it 'displays all visible widgets and the name of the widget\'s creator' do
      VCR.use_cassette('Landing Page') do
        visit '/widgets'

        expect(page).to have_content('Widgets')
        expect(page).to have_css('.widget', count: 20)
        within(first('.widget')) do
          expect(page).to have_content('A Visible Widget')
          expect(page).to have_content('Widget 1')
          expect(page).to have_link('tyler Thunderbird')
        end
      end
    end
  end
end