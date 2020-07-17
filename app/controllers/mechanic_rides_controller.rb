class MechanicRidesController < ApplicationController
  def create
    mechanic = Mechanic.find_by(:id => params[:mechanic_id])
    ride = Ride.find_by(:id => params[:id])
    MechanicRide.create(mechanic: mechanic, ride: ride)

    redirect_to "/mechanics/#{params[:mechanic_id]}"
  end
end
