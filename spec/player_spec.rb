require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/player'

RSpec.describe Player do
    it "can add new user" do
        user_board = Board.new
        computer_board = Board.new
        cruiser_1 = Ship.new("Cruiser", 3)
        sub_1 = Ship.new("Submarine", 2)
        cruiser_2 = Ship.new("Cruiser", 3)
        sub_2 = Ship.new("Submarine", 2)
        user = Player.new('Bobby', user_board, cruiser_1, sub_1)
        computer = Player.new('Computer', computer_board, cruiser_2, sub_2)

        expect(user.name).to eq('Bobby')
        expect(user.grid).to eq(user_board)
        expect(user.big_ship).to eq(cruiser_1)
        expect(user.small_ship).to eq(sub_1)
    end

    it "can tell when a user/computer has lost" do
        user_board = Board.new
        computer_board = Board.new
        cruiser_1 = Ship.new("Cruiser", 3)
        sub_1 = Ship.new("Submarine", 2)
        cruiser_2 = Ship.new("Cruiser", 3)
        sub_2 = Ship.new("Submarine", 2)
        user = Player.new('Bobby', user_board, cruiser_1, sub_1)
        computer = Player.new('Computer', computer_board, cruiser_2, sub_2)

        expect(user.has_lost?).to be false

        cruiser_1.hit
        cruiser_1.hit
        cruiser_1.hit
        expect(cruiser_1.sunk?).to be true

        sub_1.hit
        sub_1.hit
        expect(sub_1.sunk?).to be true
        expect(user.has_lost?).to be true
    end

end