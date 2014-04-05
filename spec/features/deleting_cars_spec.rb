require 'spec_helper'

feature "Deleting Cars" do
  scenario "can delete a car" do
    car = FactoryGirl.create(:car)
    visit '/'

    within("#car_#{car.id}") do
      click_link 'Delete'
    end

    # click_link "edit_car_#{car.id}"

    expect(page).to have_content("#{car.year} #{car.make} #{car.model} was removed.")
  end

end
