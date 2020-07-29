def run
    greet
    intro
    input = ""
    
    while input != "8"
    input = print_menu
    menu_nav(input)
    end
  end
    

def greet
    @time = Time.new
    if @time.hour >= 5 && @time.hour < 12 && @time.min < 60 # 5 - 11:59
        puts ""
        puts "        *** Good morning ***"
    elsif @time.hour >= 12 && @time.hour < 18 && @time.min < 60 #12 - 17:59
        puts ""
        puts "        *** Good afternoon ***"
    elsif @time.hour >= 18 && @time.hour < 24 && @time.min < 60 || @time.hour >= 0 && @time.hour < 5 && @time.min < 60 #18 - 23:59
        puts ""
        puts "        *** Good evening ***"
    end
    puts "\nWelcome to the Car-Market App!"
end



def intro
    puts 'This App is used to keep track of car dealer company activities.'
    puts ""
    puts "()" *50
    puts ""
end


def print_menu
    puts ""
    puts "Navigation Menu - choose an option"
    puts ""
    puts (" 1. ") + "The most common personality!"
    puts (" 2. ") + "The least common personality!"
    puts (" 3. ") + "Students who have siblings!"
    puts (" 4. ") + "Students who have no siblings!"
    puts (" 5. ") + "Students who have pets!"
    puts (" 6. ") + "Students who have no pets!"
    puts (" 7. ") + "Majority? Have pets or no pets!"
    puts (" 8. ") + "Exit"
    puts ""
    input = gets.chomp
end



def menu_nav(input)
      case input
        when "1"
            Personality.most_common_personality
        when "2"
            Personality.least_common_personality
        when "3"
            Student.have_siblings
        when "4"
            Student.have_no_siblings
        when "5"
            Student.have_pets_string
        when "6"
            Student.have_no_pets_string
        when "7"
            Student.pets_majority
        when "8"
            goodbye = Artii::Base.new
            puts Rainbow(goodbye.asciify("Good bye!")).yellow
        else
          puts "That option does not exist. Please select a number from 1 - 9 "
      end
end