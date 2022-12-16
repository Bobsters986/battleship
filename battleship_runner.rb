require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/player'
require './lib/game'

game = Game.new
game.start

# def render(show = false)
#     numbers_array = (1..@size).to_a
#     first_row = '  ' + numbers_array.join(' ') + " \n"

#     rows = @letters_array.map do |letter|
#       row_string = letter.to_s

#       @cells.each do |_key, cell|
#         row_string += " #{cell.render(show)}" if cell.coordinate.include?(letter)
#       end
#       [row_string += ' ']
#     end

#     first_row + rows.join("\n") + "\n"
# end