class Dealer < ActiveRecord::Base
    has_many :vehicles, as: :owner

    def buy_vehicle(vehicle)
        vehicle.update(owner: self)
        self.account_balance - vehicle.price
    end

    def sell_vehicle(vehicle, buyer)
        vehicle.update(owner: buyer)
    end

    def check_inventory
        self.vehicles
    end

    def count_inventory
        self.check_inventory.count
    end

    def inventory_names
        self.check_inventory.map do |vehicle|
            puts "#{vehicle.year} #{vehicle.make} #{vehicle.model}"
        end
    end



end