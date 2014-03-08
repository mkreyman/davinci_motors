require 'spec_helper'

car = FactoryGirl.create(:car)

feature "Displaying Cars" do
  scenario "can see cars on index page" do
    visit '/'

    expect(page).to have_content('Ford Mustang 1967 9999')
  end

end
