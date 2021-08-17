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

end
