require 'spec_helper'

car = FactoryGirl.create(:car)

feature "Editing Cars" do
  scenario "can edit a car" do
    visit '/cars/1/edit'
    click_button 'Update Car'

    expect(page).to have_content('Car was successfully updated')
  end

end
