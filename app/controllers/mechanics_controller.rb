class MechanicsController < ApplicationController
  def index
    @mechanics = Mechanic.all
  end

  def show
    @mechanic = Mechanic.find(params[:mechanic_id])
  end

  def create
    @mechanic = Mechanic.find(params[:mechanic_id])
    ride = Ride.find(params[:ride_id])
    MechanicRide.create(ride: ride, mechanic: @mechanic)
  end
end
