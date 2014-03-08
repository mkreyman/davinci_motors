require 'spec_helper'

feature "Editing Cars" do
  scenario "can edit a car" do
    car = FactoryGirl.create(:car)
    visit '/cars/1/edit'

    fill_in 'Model', with: 'Focus'
    fill_in 'Year', with: '2010'

    click_button 'Update Car'

    expect(page).to have_content('Focus')
    expect(page).to have_content('2010')
    expect(page).to have_content('Car was successfully updated')
  end

end
