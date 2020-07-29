class Dealer < ActiveRecord::Base
    has_many :vehicles, as: :owner

    def initialize(attributes=nil)
        super(attributes)
        self.inventory = 50
        self.account_balance = 500000
    end

    def buy_vehicle_from_manufacturer(vehicle)
        vehicle.owner.inventory -= 1
        vehicle.update(owner: self)
        self.inventory += 1
        self.account_balance -= vehicle.price
        self.save
    end
    
    def sell_vehicle_to_buyer(vehicle, buyer)
        vehicle.update(owner: buyer)
        self.inventory -= 1
        self.account_balance += (1.2 * vehicle.price)
        self.save
    end

    def total_inventory
        self.inventory
    end

    def purchased_vehicles
        self.vehicles
    end

    def purchased_vehicles_count
        self.purchased_vehicles.count
    end

    def purchased_vehicles_names
        self.purchased_vehicles.map do |vehicle|
            puts "#{vehicle.year} #{vehicle.make} #{vehicle.model}"
        end
    end

    def sold_vehicle
        sold_cars = Vehicle.where(owner_type: "Buyer")
    end

    def sold_vehicle_by_model
        sold_vehicle.select {|car| car.model}
    end

end