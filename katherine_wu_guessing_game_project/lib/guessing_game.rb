require "byebug"

class GuessingGame
    def initialize(min, max)
        @min = min
        @max = max
        @secret_num = rand(min..max)
        @num_attempts = 0
        @game_over = false
    end

    def num_attempts
        @num_attempts
    end

    def game_over?
        @game_over
    end

    def check_num(guess)
        @num_attempts += 1
        @game_over == true
        if @secret_num == guess
            @game_over = true
            p "you win"
        elsif @secret_num < guess
            p "too big"
        else p "too small"
        end
    end

    def ask_user
        p "enter a number"
        guess = gets.chomp.to_i
        check_num(guess)
    end

end
