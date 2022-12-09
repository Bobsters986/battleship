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

    it "has valid coordinates" do
        board = Board.new
        board.cells

        expect(board.valid_coordinate?("A1")).to eq(true)
        expect(board.valid_coordinate?("D4")).to eq(true)
        expect(board.valid_coordinate?("A5")).to eq(false)
        expect(board.valid_coordinate?("E1")).to eq(false)
        expect(board.valid_coordinate?("A22")).to eq(false)
    end

    it "number of coordinates is equal to ship length" do
        board = Board.new
        cruiser = Ship.new("Cruiser", 3)
        submarine = Ship.new("Submarine", 2)

        board.cells
        
        # number of coordinates in array should be same as the length of the ship
        expect(board.valid_placement?(cruiser, ["A1", "A2"])).to be false
        expect(board.valid_placement?(submarine, ["A2", "A3", "A4"])).to be false
    end

    it "coordinates are consecutive" do
        board = Board.new
        cruiser = Ship.new("Cruiser", 3)
        submarine = Ship.new("Submarine", 2)

        board.cells

        # the coordinates are consecutive
        expect(board.valid_placement?(cruiser, ["A1", "A2", "A4"])).to be false
        expect(board.valid_placement?(submarine, ["A1", "C1"])).to be false
        expect(board.valid_placement?(cruiser, ["A3", "A2", "A1"])).to be false
        expect(board.valid_placement?(submarine, ["C1", "B1"])).to be false
    end

    it "coordinates can't be diagonal" do
        board = Board.new
        cruiser = Ship.new("Cruiser", 3)
        submarine = Ship.new("Submarine", 2)

        board.cells

        # coordinates can’t be diagonal
        expect(board.valid_placement?(cruiser, ["A1", "B2", "C3"])).to be false
        expect(board.valid_placement?(submarine, ["C2", "D3"])).to be false
    end

    xit "all checks pass and have valid placements" do
        board = Board.new
        cruiser = Ship.new("Cruiser", 3)
        submarine = Ship.new("Submarine", 2)

        board.cells

        # If all the previous checks pass then the placement should be valid:
        expect(board.valid_placement?(submarine, ["A1", "A2"])).to be true
        expect(board.valid_placement?(cruiser, ["B1", "C1", "D1"])).to be true
    end

    # (skipped ahead, missed placing ships section) 
    # xit "checks for overlapping ships and doesn't allow" do
    #     board = Board.new
    #     cruiser = Ship.new("Cruiser", 3)

    #     board.place(cruiser, ["A1", "A2", "A3"])

    #     submarine = Ship.new("Submarine", 2)

    #     expect(board.valid_placement?(submarine, ["A1", "B1"])).to be false
    # end
end