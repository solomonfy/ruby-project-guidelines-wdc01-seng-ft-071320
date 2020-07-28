class Manufacturer < ActiveRecord::Base
    has_many :vehicles, as: :owner

    def sell_vehicle(vehicle, dealer)
        vehicle.update(owner: dealer)
    end


end