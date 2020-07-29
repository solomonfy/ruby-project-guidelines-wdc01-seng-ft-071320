require 'rainbow'

def run
    greet
    get_a_dealer
    intro
    input = ""
    
    while input != "8"
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
    puts "Log in to your account: "
    username = gets.chomp
end

def get_a_dealer
    @this_dealer = Dealer.find_or_create_by(name: account_login)
    puts "Welcome #{@this_dealer.name}"
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
    puts (" 4. ") + "Inventory list"
    puts (" 5. ") + "Check account balance"
    puts (" 6. ") + "<><><><><><><><><>"
    puts (" 7. ") + "<><><><><><><><><>"
    puts (" 8. ") + "Exit"
    puts ""
    input = gets.chomp
end

def select_manufacturer
    puts "Select a manufacturer: "
    manufacturer = gets.chomp
end

def get_a_manufacturer
    @this_manufacturer = Manufacturer.find_by(name: select_manufacturer)
end


def select_vehicle
    puts "Choose a vehicle"
    puts @this_manufacturer.manufacturer_inventory_list
    vehicle_model = gets.chomp
    
end

def get_a_vehicle
    @this_vehicle = Vehicle.find_by(model: select_vehicle)
end




def menu_nav(input)
      case input
        when "1"
            get_a_manufacturer
            get_a_vehicle
            @this_dealer.buy_vehicle_from_manufacturer(@this_vehicle)
            puts "Your purchase of a #{@this_vehicle.year} #{@this_vehicle.make} #{@this_vehicle.model} is complete"
        when "2"
            @this_dealer.sell_vehicle_to_buyer
            #puts "@this_buyer.name"
        when "3"
            print @this_dealer.inventory
        when "4"
            @this_dealer.inventory_list
        when "5"
            # Student.have_pets_string
        when "6"
            # Student.have_no_pets_string
        when "7"
            # Student.pets_majority
        when "8"
            goodbye = Artii::Base.new
            puts Rainbow(goodbye.asciify("Good bye  !")).red
        else
          puts "That option does not exist. Please select a number from 1 - 8 "
      end
end