require './lib/ship'
require './lib/cell'

class Board
    attr_reader :cells
    def initialize
        @cells = {
        "A1" => Cell.new("A1"),
        "A2" => Cell.new("A2"),
        "A3" => Cell.new("A3"),
        "A4" => Cell.new("A4"),
        "B1" => Cell.new("B1"),
        "B2" => Cell.new("B2"),
        "B3" => Cell.new("B3"),
        "B4" => Cell.new("B4"),
        "C1" => Cell.new("C1"),
        "C2" => Cell.new("C2"),
        "C3" => Cell.new("C3"),
        "C4" => Cell.new("C4"),
        "D1" => Cell.new("D1"),
        "D2" => Cell.new("D2"),
        "D3" => Cell.new("D3"),
        "D4" => Cell.new("D3")
        }
    end

    def valid_coordinate?(cell_value)
        @cells[cell_value] != nil
    end

    def valid_placement?(ship_type, ship_coordinates)
        ship_type.length == ship_coordinates.count && (valid_vertical?(ship_coordinates) || valid_horizontal?(ship_coordinates)) && overlap_check(ship_coordinates)
    end

    def consecutive_letters?(ship_coordinates)
        letters = ship_coordinates.map { |coordinate| coordinate.split('').first}
        letters.each_cons(2).all? { |letter_1, letter_2| letter_2.ord - 1 == letter_1.ord }
    end

    def consecutive_numbers?(ship_coordinates)
        numbers = ship_coordinates.map { |coordinate| coordinate.split('').last}
        numbers.each_cons(2).all? { |number_1, number_2| number_2.to_i - 1 == number_1.to_i }
    end
    
    def valid_horizontal?(ship_coordinates)
        consecutive_letters?(ship_coordinates) && same_numbers?(ship_coordinates)
    end

    def valid_vertical?(ship_coordinates)
        consecutive_numbers?(ship_coordinates) && same_letters?(ship_coordinates)
    end

    def same_numbers?(ship_coordinates)
        numbers = ship_coordinates.map { |coordinate| coordinate.split('').last}
        numbers.each_cons(2).all? { |number_1, number_2| number_2.to_i == number_1.to_i } 
    end

    def same_letters?(ship_coordinates)
        letters = ship_coordinates.map { |coordinate| coordinate.split('').first}
        letters.each_cons(2).all? { |letter_1, letter_2| letter_2.ord == letter_1.ord }
    end

    def place(ship_type, ship_coordinates)
        if self.valid_placement?(ship_type, ship_coordinates)
            ship_coordinates.each do |coordinate|
                @cells[coordinate].place_ship(ship_type)
            end
        end
    end

    def overlap_check(ship_coordinates)
        ship_coordinates.all? do |coordinate|
            @cells[coordinate].empty?
        end
    end

    def render
        layout =
        @cells.map do |key, value|
            letter, number = key.split('')
            if number == "1"
                letter + " ."
            elsif number == "4"
                " . \n"
            else
                " ."  
            end

        end.join

        "  1 2 3 4 \n" + layout
    end

end