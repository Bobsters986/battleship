require './lib/board'
require './lib/cell'
require './lib/ship'
require './lib/player'

RSpec.describe Player do
    it "can add new players" do
        player_board = Board.new
        computer_board = Board.new
        cruiser_1 = Ship.new("Cruiser", 3)
        submarine_1 = Ship.new("Submarine", 2)
        cruiser_2 = Ship.new("Cruiser", 3)
        submarine_2 = Ship.new("Submarine", 2)
        player = Player.new()
        computer = Player.new()
    end

end