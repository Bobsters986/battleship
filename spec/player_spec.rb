require './lib/board'
require './lib/cell'
require './lib/ship'
require './lib/player'

RSpec.describe Player do
    it "can add new players" do
        player_board = Board.new
        computer_board = Board.new
        cruiser_1 = Ship.new("Cruiser", 3)
        sub_1 = Ship.new("Submarine", 2)
        cruiser_2 = Ship.new("Cruiser", 3)
        sub_2 = Ship.new("Submarine", 2)
        player = Player.new('Bobby', player_board, cruiser_1, sub_1)
        computer = Player.new('Computer', computer_board, cruiser_2, sub_2)

        expect(player.name).to eq('Bobby')
        expect(player.grid).to eq(player_board)
        expect(player.big_ship).to eq(cruiser_1)
        expect(player.small_ship).to eq(sub_1)
    end

    it "can tell when a player/computer has lost" do
        player_board = Board.new
        computer_board = Board.new
        cruiser_1 = Ship.new("Cruiser", 3)
        sub_1 = Ship.new("Submarine", 2)
        cruiser_2 = Ship.new("Cruiser", 3)
        sub_2 = Ship.new("Submarine", 2)
        player = Player.new('Bobby', player_board, cruiser_1, sub_1)
        computer = Player.new('Computer', computer_board, cruiser_2, sub_2)

        expect(player.has_lost?).to be false

        cruiser_1.hit
        cruiser_1.hit
        cruiser_1.hit
        expect(player.has_lost?).to be false

        sub_1.hit
        sub_1.hit
        expect(player.has_lost?).to be true
    end

end