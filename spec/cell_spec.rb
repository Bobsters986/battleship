require './lib/ship'
require './lib/cell'

RSpec.describe Cell do
    it "exists" do

        cell = Cell.new("B4")
        cell.coordinate

        expect(cell).to be_an_instance_of(Cell)
        expect(cell.coordinate).to eq("B4")
    end

    it "can be empty" do
        cell = Cell.new("B4")
        cell.ship
        cell.empty?

        expect(cell.ship).to eq(nil)
        expect(cell.empty?).to be(true)
    end

    it "can have a ship" do
        cell = Cell.new("B4")
        cruiser = Ship.new("Cruiser", 3)

        cell.place_ship(cruiser)

        expect(cell.empty?).to eq(false)

    end

end