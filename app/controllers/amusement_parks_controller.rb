class AmusementParksController < ApplicationController
  def show
    @amusement_park = AmusementPark.find(params[:amusement_park_id])
    sorted_rides = @amusement_park.rides.sort_by { |ride| ride.name }

    @sorted_rides_with_number = sorted_rides.each_with_index.map do |ride, index|
      "#{index+1}. #{ride.name}"
    end
  end
end
