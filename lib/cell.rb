require './lib/ship'

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
        @fired_upon = true
        ship.hit if empty? == false
    end

    def fired_upon?
        @fired_upon
    end

    def render
       if fired_upon? == true
        return "H" if ship != nil
        return "M" if ship == nil
        return "X" if ship.sunk?
       end

       "."   
    end

end



    # def ship
    #     # when a cell is created, ship needs to equal nil
    #     # when we place a ship on a cell, ship method needs to 
    #     # return the name of the ship
    # end
