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
        # @fired_upon = true
        # ship.hit if empty? == false
        @fired_upon = true 
        if @ship != nil
            @ship.hit
        end
    end

    def fired_upon?
        @fired_upon
    end

    # def render
    #    if fired_upon? == true
    #     return "M" if empty
    #     return "X" if ship.sunk?
    #     return "H" if ship != nil
    #    end

    #    "."   
    # end

    def render(args = false)
        if fired_upon?
            return "M" if empty?
            # ship == nil
            return "X" if ship.sunk?
            return "H" if !empty?
            # != nil
        end

        return "S" if args == true && !empty?
        "."

    end

end



