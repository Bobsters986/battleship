# require './lib/ship'
require './lib/cell'

RSpec.describe Cell do
    it "exists" do

        cell = Cell.new("B4")

        expect(cell).to be_an_instance_of(Cell)
        expect(cell.coordinate).to eq("B4")
    end

    it "can have a ship or be empty" do
        cell = Cell.new("B4")

        expect(cell.ship).to eq(nil)
        expect(cell.empty?).to be(true)
    end

    


end