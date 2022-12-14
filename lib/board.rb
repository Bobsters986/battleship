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
        "D4" => Cell.new("D4")
        }
    end

    def valid_coordinate?(cell_value)
        cell_value.all? do |cell|
            @cells.keys.include?(cell)
        end
        # @cells[cell_value] != nil, didn't work when running game
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

    # def render(args = false)
    #     rendered = "  1 2 3 4 \nA "
    
    #     rendered += board_cells(args)
    
    #     rendered.insert(21, "\nB ")
    #     rendered.insert(32, "\nC ")
    #     rendered.insert(43, "\nD ")
    #     rendered.insert(53, " \n")
    # end
    
    # def board_cells(args)
    #     @cells.each_value.map do |cell|
    #         cell.render(args)
    #     end.join(" ")
    # end

    def render(show = false)
        if show == true
            "  1 2 3 4 \n" \
            "A #{@cells["A1"].render(true)} #{@cells["A2"].render(true)} #{@cells["A3"].render(true)} #{@cells["A4"].render(true)} \n" \
            "B #{@cells["B1"].render(true)} #{@cells["B2"].render(true)} #{@cells["B3"].render(true)} #{@cells["B4"].render(true)} \n" \
            "C #{@cells["C1"].render(true)} #{@cells["C2"].render(true)} #{@cells["C3"].render(true)} #{@cells["C4"].render(true)} \n" \
            "D #{@cells["D1"].render(true)} #{@cells["D2"].render(true)} #{@cells["D3"].render(true)} #{@cells["D4"].render(true)} \n" \
        else
            "  1 2 3 4 \n" \
            "A #{@cells["A1"].render} #{@cells["A2"].render} #{@cells["A3"].render} #{@cells["A4"].render} \n" \
            "B #{@cells["B1"].render} #{@cells["B2"].render} #{@cells["B3"].render} #{@cells["B4"].render} \n" \
            "C #{@cells["C1"].render} #{@cells["C2"].render} #{@cells["C3"].render} #{@cells["C4"].render} \n" \
            "D #{@cells["D1"].render} #{@cells["D2"].render} #{@cells["D3"].render} #{@cells["D4"].render} \n" \
        end
    end
end