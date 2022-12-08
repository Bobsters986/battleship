require './lib/ship'
require './lib/cell'
require './lib/board'

RSpec.describe Board do
    it "exists" do
        board = Board.new
        board.cells

        expect(board.cells).to be_a(Hash)
        expect(board.cells.count).to eq(16)
        # expect(board.cells.keys[0]).to eq(cells.coordinate)
        
    end
end