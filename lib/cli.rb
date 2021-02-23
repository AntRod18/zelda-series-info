class CLI


    def run
        greeting
        puts "Please wait while I gather all the information"
        API.new.get_and_create_games
        display
    end

    def greeting
        puts "Welcoeme to the Zelda series CLI!!!"
    end

    def display
        Zelda.all.each.with_index(1) do |game, index|
            puts "#{index}. #{game.name}; #{game.released_date}"
        end
    end
    

end