require './lib/board'
require './lib/cell'
require './lib/ship'

RSpec.describe Board do
    it "exists" do
        board = Board.new
        board.cells

        expect(board).to be_an_instance_of(Board)
        expect(board.cells).to be_a(Hash)
        expect(board.cells.count).to eq(16)
        # expect(board.cells.keys[0]).to eq(cells.coordinate)
        
    end

    it "has valid placements for ships" do
        board = Board.new
        cruiser = Ship.new("Cruiser", 3)
        submarine = Ship.new("Submarine", 2)

        board.cells
        
        # number of coordinates in array should be same as the length of the ship
        expect(board.valid_placement?(cruiser, ["A1", "A2"])).to be false
        expect(board.valid_placement?(submarine, ["A2", "A3", "A4"])).to be false

        # the coordinates are consecutive
        expect(board.valid_placement?(cruiser, ["A1", "A2", "A4"])).to be false
        expect(board.valid_placement?(submarine, ["A1", "C1"])).to be false
        expect(board.valid_placement?(cruiser, ["A3", "A2", "A1"])).to be false
        expect(board.valid_placement?(submarine, ["C1", "B1"])).to be false

        # coordinates can’t be diagonal
        expect(board.valid_placement?(cruiser, ["A1", "B2", "C3"])).to be false
        expect(board.valid_placement?(submarine, ["C2", "D3"])).to be false

        # If all the previous checks pass then the placement should be valid:
        expect(board.valid_placement?(submarine, ["A1", "A2"])).to be true
        expect(board.valid_placement?(cruiser, ["B1", "C1", "D1"])).to be true

    end
end