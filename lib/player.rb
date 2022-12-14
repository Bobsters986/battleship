require './lib/board'
require './lib/cell'
require './lib/ship'

class Player
    attr_reader :name, :grid, :big_ship, :small_ship

    def initialize(name, grid, big_ship, small_ship)
        @name = name
        @grid = grid
        @big_ship = big_ship
        @small_ship = small_ship
    end

    def has_lost?
        @big_ship.sunk? && @small_ship.sunk?
    end
end