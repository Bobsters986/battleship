require './lib/board'
require './lib/cell'
require './lib/ship'

RSpec.describe Board do
    it "exists" do
        board = Board.new
        board.cells

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

end