require 'spec_helper'

feature "Editing Cars" do
  scenario "can edit a car" do
    car = FactoryGirl.create(:car)
    visit '/'

    within("#car_#{car.id}") do
      click_link 'Edit'
    end

    # click_link "edit_car_#{car.id}"

    fill_in 'Model', with: 'Focus'
    fill_in 'Year', with: '2010'

    click_button 'Update Car'

    expect(page).to have_content('Focus')
    expect(page).to have_content('2010')
    expect(page).to have_content('Car was successfully updated')
  end

end
