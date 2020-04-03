require 'rails_helper'

RSpec.describe AmusementPark, type: :model do
  describe 'relationships' do
    it {should have_many :rides}
  end
  describe 'instance methods' do
    it '.average_song_length' do
      knotts_berry = AmusementPark.create(name: "Knott's Berry Farm", admission_price: "$89.00")
      Ride.create(name: "Silver Bullet", thrill_rating: 8, amusement_park_id: knotts_berry.id)
      Ride.create(name: "Jaguar!", thrill_rating: 4, amusement_park_id: knotts_berry.id)
      Ride.create(name: "Xcelerator The Ride", thrill_rating: 9, amusement_park_id: knotts_berry.id)

      expect(knotts_berry.average_thrill_rating).to eq(7)
    end
  end
end
