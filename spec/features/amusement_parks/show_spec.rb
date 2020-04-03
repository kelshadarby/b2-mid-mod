require 'rails_helper'

RSpec.describe "As a visitor on an amusement park's show page " do
  it "I can view that parks name, admission price, all rides in alphabetical order and average thrill rating" do
    knotts_berry = AmusementPark.create(name: "Knott's Berry Farm", admission_price: "$89.00")
    silver_bullet = Ride.create(name: "Silver Bullet", thrill_rating: 8, amusement_park_id: knotts_berry.id)
    jaguar = Ride.create(name: "Jaguar!", thrill_rating: 5, amusement_park_id: knotts_berry.id)
    xcelerator = Ride.create(name: "Xcelerator The Ride", thrill_rating: 9, amusement_park_id: knotts_berry.id)

    disney_world = AmusementPark.create(name: "Disney World", admission_price: "$104.00")
    space_mountain = Ride.create(name: "Space Mountain", thrill_rating: 8, amusement_park_id: disney_world.id)
    thunder_mountain = Ride.create(name: "Big Thunder Mountain Railroad", thrill_rating: 9, amusement_park_id: disney_world.id)
    soarin = Ride.create(name: "Soarin'", thrill_rating: 4, amusement_park_id: disney_world.id)

    visit "/amusement_parks/#{knotts_berry.id}"

    expect(page).to have_content(knotts_berry.name)
    expect(page).to have_content("Admissions: #{knotts_berry.admission_price}")
    expect(page).to have_content("1. #{jaguar.name}")
    expect(page).to have_content("2. #{silver_bullet.name}")
    expect(page).to have_content("3. #{xcelerator.name}")
    expect(page).to have_content("Average Thrill Rating of Rides: 7.3/10")

    expect(page).to_not have_content(disney_world.name)
    expect(page).to_not have_content("Admissions: #{disney_world.admission_price}")
    expect(page).to_not have_content("1. #{soarin.name}")
    expect(page).to_not have_content("2. #{space_mountain.name}")
    expect(page).to_not have_content("3. #{thunder_mountain.name}")
    expect(page).to_not have_content("Average Thrill Rating of Rides: 7/10")
  end
end
