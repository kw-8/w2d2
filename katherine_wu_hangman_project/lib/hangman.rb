class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]
  
  attr_reader :guess_word, :attempted_chars, :remaining_incorrect_guesses

  def self.random_word
    DICTIONARY.sample
  end

  def initialize
    @secret_word = self.class.random_word
    @guess_word = Array.new(@secret_word.length){"_"}
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def already_attempted?(char)
    @attempted_chars.include?(char)
  end

  def get_matching_indices(char)
    (0...@secret_word.length).select{|i| @secret_word[i] == char}
  end

  def fill_indices(char, indices_arr)
    indices_arr.each{|i| @guess_word[i] = char}
  end



  # === PART 2 === #

  def try_guess(char)
    if already_attempted?(char)
      p "that has already been attempted"
      false
    else
      @attempted_chars << char
      if @secret_word.include?(char)
        fill_indices(char, get_matching_indices(char))
        true
      else @remaining_incorrect_guesses -= 1
        false
      end
    end
  end

  def ask_user_for_guess
    p "Enter a char:"
    try_guess(gets.chomp)
  end
  
  def win?
    if @guess_word.join("") == @secret_word
      p "WIN"
      true
    else false
    end
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      p "LOSE"
      true
    else false
    end
  end

  def game_over?
    if win? || lose?
      p @secret_word
      true
    else false
    end
  end

end
