require "tty-prompt"

class Manufacturer < ActiveRecord::Base
    has_many :vehicles, as: :owner

    def sell_vehicle(vehicle, dealer)
        vehicle.update(owner: dealer)
    end

    def inventory
        self.vehicles
    end

    def inventory_count
        self.inventory.count
    end

    def manufacturer_inventory_list
        self.inventory.map.with_index(1) {|vehicle, index| print "#{index}. #{vehicle.year} #{vehicle.make} #{vehicle.model}\n"}
        
        # self.inventory.map{|vehicle| print "#{vehicle.id}. #{vehicle.year} #{vehicle.make} #{vehicle.model}\n"}
    end


end