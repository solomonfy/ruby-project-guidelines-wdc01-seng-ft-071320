require 'rainbow'

def run
    greet
    get_a_dealer
    intro
    input = ""
    
    while input != "10"
        input = print_menu
        menu_nav(input)
    end
end
    

def greet

    # bar = TTY::ProgressBar.new("Loading [:bar]", total: 30)

    # 30.times do
    #     sleep(0.1)
    #     bar.advance(1)
    # end

    @time = Time.new
    if @time.hour >= 5 && @time.hour < 12 && @time.min < 60
        puts ""
        puts         Rainbow("\n\n                  *** Good morning ***\n\n").green.bold
    elsif @time.hour >= 12 && @time.hour < 18 && @time.min < 60
        puts ""
        puts         Rainbow("\n\n                  *** Good afternoon ***\n\n").green.bold
    elsif @time.hour >= 18 && @time.hour < 24 && @time.min < 60 || @time.hour >= 0 && @time.hour < 5 && @time.min < 60
        puts ""
        puts         Rainbow("\n\n                  *** Good evening ***\n\n").green.bold
    end

          puts"  ░█──░█ ░█▀▀▀ ░█─── ░█▀▀█ ░█▀▀▀█ ░█▀▄▀█ ░█▀▀▀ 　 ▀▀█▀▀ ░█▀▀▀█ "
          puts"  ░█░█░█ ░█▀▀▀ ░█─── ░█─── ░█──░█ ░█░█░█ ░█▀▀▀ 　 ─░█── ░█──░█ "
          puts"  ░█▄▀▄█ ░█▄▄▄ ░█▄▄█ ░█▄▄█ ░█▄▄▄█ ░█──░█ ░█▄▄▄ 　 ─░█── ░█▄▄▄█ \n\n"
            
        puts"   ░█▀▀█ ─█▀▀█ ░█▀▀█ ── ░█▀▄▀█ ─█▀▀█ ░█▀▀█ ░█─▄▀ ░█▀▀▀ ▀▀█▀▀ "
        puts"   ░█─── ░█▄▄█ ░█▄▄▀ ▀▀ ░█░█░█ ░█▄▄█ ░█▄▄▀ ░█▀▄─ ░█▀▀▀ ─░█── "
        puts"   ░█▄▄█ ░█─░█ ░█─░█ ── ░█──░█ ░█─░█ ░█─░█ ░█─░█ ░█▄▄▄ ─░█── \n\n"
                    
           puts"                     ─█▀▀█ ░█▀▀█ ░█▀▀█ "
           puts"                     ░█▄▄█ ░█▄▄█ ░█▄▄█ "
           puts"                     ░█─░█ ░█─── ░█───  "

end



def account_login
    puts "\n\nLog in to your account: \n\n"
    username = gets.chomp
end

def get_a_dealer
    @this_dealer = Dealer.find_or_create_by(name: account_login)
    puts "\n\nWelcome #{@this_dealer.name} !"
        # if dealer.name .gsub(/ /, "").downcase != account_login.to_s.gsub(/ /, "").downcase
    @this_dealer
end


def intro
    puts "\n\n\nThis App is used to keep track of your company's activities."
    puts ""
end


def print_menu
    puts ""
    menu = Artii::Base.new
    puts Rainbow(menu.asciify("Menu - choose an option")).green
    puts ""
    puts (" 1. ") + "Buy a car from manufacturer"
    puts (" 2. ") + "Sell a car to a buyer"
    puts (" 3. ") + "Check inventory"
    puts (" 4. ") + "See vehicle information"
    puts (" 5. ") + "Check account balance"
    puts (" 6. ") + 
    puts (" 7. ") + 
    puts (" 8. ") + "Change vehicle prices"
    puts (" 9. ") + "All suppliers(manufacturers)"
    puts (" 10. ") + "Exit"
    puts ""
    input = gets.chomp
end

# Helper methods for buy a car from manufacturer

def select_manufacturer
    puts "\n\nSelect a manufacturer: "
    puts Manufacturer.manufacturer_list
    @manufacturer_index = gets.chomp.to_i
    if !@manufacturer_index.between?(1, Manufacturer.all.count)
        # 14.between?(10,20)
        puts "That option does not exist. Please select again"
        select_manufacturer
    end
end

def get_a_manufacturer
    @this_manufacturer = Manufacturer.all[@manufacturer_index - 1]
end

def select_vehicle
    puts "\n\nChoose a number"
    puts @this_manufacturer.manufacturer_inventory_list
    @man_vehicle_index = gets.chomp.to_i
    if !@man_vehicle_index.between?(1, @this_manufacturer.vehicles.count)
        puts "That option does not exist. Please select again"
        select_vehicle
    end
end

def get_vehicle_from_manufacturer
    @this_vehicle = @this_manufacturer.vehicles[@man_vehicle_index - 1]
end


# Helper methods for sell a vehicle to buyer

def enter_buyer
    puts "\n\nEnter a buyer"
    buyer_name = gets.chomp
end

def get_a_buyer
    @this_buyer = Buyer.find_or_create_by(name: enter_buyer)
end

def select_vehicle_from_dealer
    puts "\nChoose a vehicle\n"
    puts @this_dealer.inventory_list
    @dealer_vehicle_index = gets.chomp.to_i
    if !@dealer_vehicle_index.between?(1, @this_dealer.vehicles.count)
        puts "That option does not exist. Please select again"
        select_vehicle_from_dealer
    end
end

def get_vehicle_from_dealer
        @this_vehicle = @this_dealer.vehicles[@dealer_vehicle_index - 1]
    # else
    #     puts "That car does not exist, please try again!"
    #     select_vehicle_for_buyer
    # end
end

#Change vehicle price helper method
def choose_vehicle_price
    puts "Enter new price"
    @new_price = gets.chomp.to_i
    if !@new_price.is_a? Numeric
        puts "This value is invalid. Please try again."
        choose_vehicle_price
    end
end

def change_vehicle_price(vehicle, price)
    vehicle.price = price
    puts "#{vehicle.print_vehicle_info} now costs $#{price}"
end

def menu_nav(input)
      case input
        when "1"
            select_manufacturer
            get_a_manufacturer
            select_vehicle
            get_vehicle_from_manufacturer
            @this_dealer.buy_vehicle_from_manufacturer(@this_vehicle)
                puts "\n\nYour purchase of a #{@this_vehicle.year} #{@this_vehicle.make} #{@this_vehicle.model} is complete!"
        when "2"
            if @this_dealer.vehicles.count > 0
                get_a_buyer
                select_vehicle_from_dealer
                get_vehicle_from_dealer
                @this_dealer.sell_vehicle_to_buyer(@this_vehicle, @this_buyer)
                puts "\n#{@this_buyer.name} bought #{@this_vehicle.year} #{@this_vehicle.make} #{@this_vehicle.model} from #{@this_dealer.name}!"
            else
                puts "\nYou don't have a vehicle to sell, please stock a vehicle from your suppliers!"
            end
        when "3"
            @this_dealer.inventory_list
        when "4"
            select_vehicle_from_dealer
            get_vehicle_from_dealer
            @this_vehicle.all_info
        when "5"
            puts "Your current balance is $#{@this_dealer.account_balance}"
        when "6"
            # 
        when "7"
            # 
        when "8"
            select_vehicle_from_dealer
            get_vehicle_from_dealer
            choose_vehicle_price
            change_vehicle_price(@this_vehicle, @new_price)
            
        when "9"
            Manufacturer.manufacturer_list
        when "10"
            goodbye = Artii::Base.new
            puts Rainbow(goodbye.asciify("Good bye  !")).red
        else
          puts "That option does not exist. Please select again"
      end
end