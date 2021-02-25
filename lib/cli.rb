


class CLI
    
    attr_accessor :input

    def run
        greeting
        main_menu
        
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

    def main_menu
        prompt = TTY::Prompt.new
        input = prompt.select("Please choose a game you would like more information about.", display, per_page: 10)
        game = Zelda.find_by_name(input)
        display_game_data(game)
    end

    def display_game_data(input)
        puts "***********************************************"
        puts "#{input.name}: Released on #{input.released_date}"
        puts "***********************************************"
        puts "#{input.description}"
        puts "***********************************************"
        puts "Developed by #{input.developer}"
        puts "***********************************************"
        puts "Published by #{input.publisher}"
        puts "***********************************************"
    end
    

end