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
        @empty = false
    end

    def fire_upon
        @fired_upon = true 
        if @ship != nil
            @ship.hit
        end
    end

    def fired_upon?
        @fired_upon
    end

    def render(show_ships = false)
        if show_ships == false
            if fired_upon?
                return "M" if empty?
                return "X" if ship.sunk?
                return "H" if !empty?
            else
                "."
            end
        else show_ships == true
            if fired_upon?
                return "M" if empty?
                return "X" if ship.sunk?
                return "H" if !empty?
            else
                return "." if empty?
                return "S" if !empty?
            end
        end
    end
end



