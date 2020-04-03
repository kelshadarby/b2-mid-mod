require 'rails_helper'

RSpec.describe "As a visitor on a mechanics show page", type: :feature do
  it "I can view a mechanics name, years of experience, rides they’re working on and a form to add a ride" do
    bob = Mechanic.create(name: "Bob the Builder", years_experience: "13")
    manny = Mechanic.create(name: "Handy Manny", years_experience: "7")

    disney_world = AmusementPark.create(name: "Disney World", admission_price: "$104.00")

    space_mountain = Ride.create(name: "Space Mountain", thrill_rating: 8, amusement_park_id: disney_world.id)
    thunder_mountain = Ride.create(name: "Big Thunder Mountain Railroad", thrill_rating: 9, amusement_park_id: disney_world.id)
    soarin = Ride.create(name: "Soarin'", thrill_rating: 4, amusement_park_id: disney_world.id)

    MechanicRide.create!(ride: space_mountain, mechanic: bob)
    MechanicRide.create!(ride: thunder_mountain, mechanic: bob)

    MechanicRide.create!(ride: space_mountain, mechanic: manny)
    MechanicRide.create!(ride: thunder_mountain, mechanic: manny)
    MechanicRide.create!(ride: soarin, mechanic: manny)

    visit "/mechanics/#{bob.id}"

    expect(page).to have_content("Mechanic: #{bob.name}")
    expect(page).to have_content("Years of Experience: #{bob.years_experience}")
    expect(page).to have_content("Current rides #{bob.name} is working on:")
    expect(page).to have_content(space_mountain.name)
    expect(page).to have_content(thunder_mountain.name)

    expect(page).to_not have_content("Mechanic: #{manny.name}")
    expect(page).to_not have_content("Years of Experience: #{manny.years_experience}")
    expect(page).to_not have_content("Current rides #{manny.name} is working on:")
    expect(page).to_not have_content(soarin.name)

    expect(page).to have_field("Add a ride to workload:")
    expect(page).to have_button("Submit")

  end

  it "I can view a mechanics name, years of experience, rides they’re working on and a form to add a ride" do
    bob = Mechanic.create(name: "Bob the Builder", years_experience: "13")

    disney_world = AmusementPark.create(name: "Disney World", admission_price: "$104.00")

    space_mountain = Ride.create(name: "Space Mountain", thrill_rating: 8, amusement_park_id: disney_world.id)
    thunder_mountain = Ride.create(name: "Big Thunder Mountain Railroad", thrill_rating: 9, amusement_park_id: disney_world.id)
    soarin = Ride.create(name: "Soarin'", thrill_rating: 4, amusement_park_id: disney_world.id)

    MechanicRide.create!(ride: space_mountain, mechanic: bob)
    MechanicRide.create!(ride: thunder_mountain, mechanic: bob)

    visit "/mechanics/#{bob.id}"

    expect(page).to have_content("Mechanic: #{bob.name}")
    expect(page).to have_content("Years of Experience: #{bob.years_experience}")
    expect(page).to have_content("Current rides #{bob.name} is working on:")
    expect(page).to have_content(space_mountain.name)
    expect(page).to have_content(thunder_mountain.name)

    fill_in "Add a ride to workload:", with: "#{soarin.id}"
    click_button("Submit")

    expect(current_path).to eq("/mechanics/#{bob.id}")
    expect(page).to have_content(space_mountain.name)
    expect(page).to have_content(thunder_mountain.name)
    expect(page).to have_content(soarin.name)
  end
end
