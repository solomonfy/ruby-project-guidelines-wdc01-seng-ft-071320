require 'rainbow'

def run
    greet
    prompt_login
    get_a_dealer
#     intro
#     input = ""
    
#     while input != "8"
#     input = print_menu
#     menu_nav(input)
#     end
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


def prompt_login
    puts "Log in to your account: "
end

def account_login
    username = gets.chomp
end

def get_a_dealer
    @this_dealer = Dealer.find_or_create_by(name: account_login)
    puts "Welcome #{@this_dealer.name}"
        # if dealer.name .gsub(/ /, "").downcase != account_login.to_s.gsub(/ /, "").downcase
    binding.pry
end


def intro
    puts "\n\n\nThis App is used to keep track of car dealer company activities."
    puts ""
end


def print_menu
    puts ""
    menu = Artii::Base.new
    puts Rainbow(menu.asciify("Menu - choose an option")).green
    puts ""
    puts (" 1. ") + "Buy a car from manufacturer"
    puts (" 2. ") + "Sell a car to a buyer"
    puts (" 3. ") + "Check total inventory"
    puts (" 4. ") + "Purchased vehicles"
    puts (" 5. ") + "<><><><><><><><><>"
    puts (" 6. ") + "<><><><><><><><><>"
    puts (" 7. ") + "<><><><><><><><><>"
    puts (" 8. ") + "Exit"
    puts ""
    input = gets.chomp
end



def menu_nav(input)
      case input
        when "1"
            get_a_dealer.buy_vehicle_from_manufacturer
        when "2"
            Dealer.sell_vehicle_to_buyer
        when "3"
            Dealer.total_inventory
        when "4"
            Dealer.purchased_vehicles_names
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