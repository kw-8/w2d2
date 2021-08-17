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

end
