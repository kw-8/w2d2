require_relative "room"

class Hotel
  def initialize(name, hash)
    @name = name
    @rooms = hash
  end
end
