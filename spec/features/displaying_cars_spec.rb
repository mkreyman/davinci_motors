require 'spec_helper'

feature "Displaying Cars" do
  scenario "can see cars on index page" do
    car = FactoryGirl.create(:car)
    visit '/'

    expect(page).to have_content('Ford Mustang 1967 9999')
  end

end
