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
        expect(cell.ship).to eq(cruiser)
        expect(cell.empty?).to eq(false)

    end

    it "knows when it has been fired upon" do
        cell = Cell.new("B4")
        cruiser = Ship.new("Cruiser", 3)

        cell.place_ship(cruiser)
        expect(cell.fired_upon?).to be(false)

        cell.fire_upon
        expect(cell.ship.health).to eq(2)
        expect(cell.fired_upon?).to eq(true)

    end

    it "will render a dot by default" do
        cell_1 = Cell.new("B4")

        expect(cell_1.render).to eq(".")
    end

    it "will render an M for miss" do
        cell_1 = Cell.new("B4")
        cruiser = Ship.new("Cruiser", 3)

        cell_1.fire_upon
        expect(cell_1.render).to eq("M")
    end

    it "will render an H for hit" do
        cell_2 = Cell.new("C3")
        cruiser = Ship.new("Cruiser", 3)

        cell_2.place_ship(cruiser)
        cell_2.fire_upon
        
        expect(cell_2.render).to eq("H")
    end

    xit "will render an S to show a ship" do
        cell_2 = Cell.new("C3")
        cruiser = Ship.new("Cruiser", 3)

        cell_2.place_ship(cruiser)
        expect(cell_2.render).to eq(".")
        expect(cell_2.render(true)).to eq("S")
    end



end

# cell will render a dot by default
# We fire at the cell
# When the cell is hit, the cell will render "M" because it has no ship
