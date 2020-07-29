class Dealer < ActiveRecord::Base
    has_many :vehicles, as: :owner

    def account_login(name)
        Dealer.find_or_create_by(name: name)
        binding.pry
    end

    def buy_vehicle(vehicle)
        vehicle.update(owner: self)
        # self.increment!(:inventory)
        self.inventory += 1
        self.account_balance -= vehicle.price
        self.save
    end

    def sell_vehicle(vehicle, buyer)
        vehicle.update(owner: buyer)
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



end