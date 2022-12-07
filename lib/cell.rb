class Cell
    attr_reader :coordinate, :ship
    def initialize(coordinate)
        @coordinate = coordinate
        @ship = nil
        @fired_upon = false
    end

    def empty?
        ship.nil?
    end

    def place_ship(ship_type)
        @ship = ship_type
    end

    def fire_upon
        # require 'pry'; binding.pry
        # we place a ship on a cell
        # when we check if the ship has been fired at, it returns false
        # we fire at the ship
        # the ship's health goes down by 1
        # when we check if the ship has been fired at, it then returns true
        ship.hit
        @fired_upon = true
    end

    def fired_upon?
        @fired_upon
    end

end



    # def ship
    #     # when a cell is created, ship needs to equal nil
    #     # when we place a ship on a cell, ship method needs to 
    #     # return the name of the ship
    # end