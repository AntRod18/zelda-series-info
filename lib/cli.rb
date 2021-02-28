


class CLI
    
    attr_accessor :input

    def run
        greeting
        menu
    end

    def greeting
        puts "Welcome to the Zelda series CLI!!!"
        puts "Please wait while I gather all the information"
        API.new.get_and_create_games
    end

    def display
        Zelda.all.collect do |game|
            game.name
        end
    end

    def menu
        prompt = TTY::Prompt.new
        input = prompt.select("Please choose a game you would like more information about.", display, per_page: 10)
        game = Zelda.find_by_name(input)
        display_game_data(game)
        second_input = nil
        while second_input != "Exit"
            second_input = prompt.select("What would you like to do?", %w(Menu Exit))
            case second_input
            when "Menu"
                menu
            when "Exit"
                goodbye
            end
        end
    end

    def display_game_data(input)
        puts "***********************************************"
        puts "#{input.name}: Released on#{input.released_date}"
        puts "***********************************************"
        puts "#{input.description}"
        puts "***********************************************"
        puts "Developed by #{input.developer}"
        puts "***********************************************"
        puts "Published by #{input.publisher}"
        puts "***********************************************"
    end
    
    def goodbye
        puts "Have a great day and thank you for using my Zelda cli!!!"
        exit
    end
end