require 'rails_helper'

RSpec.describe "As a visitor", type: :feature do
  it "I can view all mechanics on the mechanic index page" do
    bob = Mechanic.create(name: "Bob the Builder", years_experience: "13")
    manny = Mechanic.create(name: "Handy Manny", years_experience: "7")

    visit "/mechanics"

    expect(page).to have_content("All Mechanics")
    expect(page).to have_content("#{bob.name} - #{bob.years_experience} years of experience")
    expect(page).to have_content("#{manny.name} - #{manny.years_experience} years of experience")
  end
end
