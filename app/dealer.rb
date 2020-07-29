class Dealer < ActiveRecord::Base
    has_many :vehicles, as: :owner

    def initialize(attributes=nil)
        super(attributes)
        self.account_balance = 500000
    end

    def buy_vehicle_from_manufacturer(vehicle)
        vehicle.update(owner: self)
        self.account_balance -= vehicle.price
        self.save
    end
    
    def sell_vehicle_to_buyer(vehicle, buyer)
        vehicle.update(owner: buyer)
        self.account_balance += (1.2 * vehicle.price)
        self.save
    end

    def inventory
        if self.vehicles.count != 0
            puts self.vehicles
        else
            puts "No vehicles"
        end
    end

    def inventory_count
        self.vehicles.count
    end

    def inventory_list
        if self.inventory_count > 0
            self.vehicles.map {|vehicle| puts "#{vehicle.year} #{vehicle.make} #{vehicle.model}\n"}
        else
            puts "No vehicles"
        end
    end

    def sold_vehicle
        sold_cars = Vehicle.where(owner_type: "Buyer")
    end

    def sold_vehicle_by_model
        sold_vehicle.select {|car| car.model}
    end

end