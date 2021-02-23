class CLI
    def initialize
        # Grabbed all zelda games data
        API.new.get_games_data
    end

    

end