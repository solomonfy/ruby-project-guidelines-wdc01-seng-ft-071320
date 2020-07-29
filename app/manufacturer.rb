class Manufacturer < ActiveRecord::Base
    has_many :vehicles, as: :owner

    def initialize(attributes=nil)
        super(attributes)
        self.inventory = 500
    end

    def sell_vehicle(vehicle, dealer)
        vehicle.update(owner: dealer)
    end


end