require 'spec_helper'

feature "Displaying Cars" do
  scenario "can see cars on index page" do
    car = FactoryGirl.create(:car)
    visit '/'

    expect(page).to have_content('Ford')
    expect(page).to have_content('Mustang')
    expect(page).to have_content('1967')
    expect(page).to have_content('$9,999.99')
  end

end
