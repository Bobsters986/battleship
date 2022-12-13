class Game

    def initialize
        @user_board = Board.new
        @computer_board = Board.new
        @cruiser_1 = Ship.new("Cruiser", 3)
        @sub_1 = Ship.new("Submarine", 2)
        @cruiser_2 = Ship.new("Cruiser", 3)
        @sub_2 = Ship.new("Submarine", 2)
        @user = Player.new('Bobby', @user_board, @cruiser_1, @sub_1)
        @computer = Player.new('Computer', @computer_board, @cruiser_2, @sub_2)
    end

    def start
       p "Welcome to BATTLESHIP."
       p "Enter 'p' to play. Enter 'q' to quit."

        user_input = gets.chomp.downcase
        if user_input == "p"
            run_game
        elsif user_input == "q"
            p "Thanks for playing!"
        else
            start
        end 
        
    end

    def run_game
        p "I have laid out my ships on the grid."
        p "You now need to lay out your two ships."
        p "The Cruiser is three units long and the Submarine is two units long."
        p 
        p @user_board.render
        computer_ship_placement
        user_ship_placement
    end

    def computer_ship_placement
        loop do
            comp_input = @computer_board.cells.keys.sample(3)
            if @computer_board.valid_placement?(@cruiser_2, comp_input) == true
               @computer_board.place(@cruiser_2, comp_input)
               break
            end
        end
        loop do
            comp_input = @computer_board.cells.keys.sample(2)
            if @computer_board.valid_placement?(@sub_2, comp_input) == true
               @computer_board.place(@sub_2, comp_input)
               break
            end
        end
    end

    def user_ship_placement
        p "Enter the squares for the Cruiser (3 spaces):"

        loop do
            user_input = gets.chomp.upcase.split(" ")
            if @user_board.valid_coordinate?(user_input) == true && @user_board.valid_placement?(@cruiser_1, user_input) == true
                @user_board.place(@cruiser_1, user_input)
                break
            else
                p "Those are invalid coordinates. Please try again:"
            end
        end
        p 
        p @user_board.render(true)
        p "Enter the squares for the Submarine (2 spaces):"

        loop do
            user_input = gets.chomp.upcase.split(" ")
            if @user_board.valid_coordinate?(user_input) == true && @user_board.valid_placement?(@sub_1, user_input) == true
                @user_board.place(@sub_1, user_input)
                break
            else
                p "Those are invalid coordinates. Please try again:"
            end
        end
        p 
        p @user_board.render(true)
        p 
        p "All ships placed, lets play!"
        turn
    end


    # def turn 
    #     until @player.has_lost? == true

    #     end
    # end

    def turn
        while winner? == false
            display_boards
            user_shot
            computer_shot
        end
    end

    def display_boards
        p "=============COMPUTER BOARD=============\n"
        puts @computer_board.render
        p "==============PLAYER BOARD==============\n"
        puts @user_board.render(true)
    end

    def shot_results(user_shot)
        if @computer_board.cells[user_shot].render == "M"
            p "Your shot on " + user_shot + " was a miss!"
        elsif @computer_board.cells[user_shot].render == "H"
            p "Your shot on " + user_shot + " was a hit!"
        else @computer_board.cells[user_shot].render == "X"
            p "You have sunk my ship!"
        end
    end

    def user_shot
        p "Enter the coordinate for your shot."
        # user_input = gets.chomp.upcase
        user_input = @user_board.cells.keys.sample

        until @computer_board.valid_coordinate?([user_input]) == true && @computer_board.cells[user_input].fired_upon? == false
            p "Please try again"
            # user_input = gets.chomp.upcase
            user_input = @user_board.cells.keys.sample
        end

        @computer_board.cells[user_input].fire_upon
        shot_results(user_input)
    end

    def computer_shot
        comp_input = @user_board.cells.keys.sample
        until @user_board.valid_coordinate?([comp_input]) == true && @user_board.cells[comp_input].fired_upon? == false
            comp_input = @user_board.cells.keys.sample
        end

        @user_board.cells[comp_input].fire_upon
    end

    def winner?
        if @user.has_lost? == true
            p "I won!"
        elsif @computer.has_lost? == true
            p "You won!"
        else
            false
        end
    end





    
end

# def shot_results
#     if @computer_board.cells[user_input].fired_upon? && @computer_board.cells[user_input].!empty?
#         p "Your shot was a hit!"
#     elsif @computer_board.cells[user_input].fired_upon? && @computer_board.cells[user_input].empty?
#         p "Your shot was a miss!"
#     else @computer_board.cells[user_input].fired_upon?
#         p "You have sunk my ship!"
#     end
# end