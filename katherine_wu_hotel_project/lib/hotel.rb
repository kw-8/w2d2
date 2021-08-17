require_relative "room"
require "byebug"

class Hotel
    attr_reader :rooms

    def initialize(name, hash)
        @name = name
        @rooms = {}
        hash.map{|name, occupancy| @rooms[name] = Room.new(occupancy)}
    end

    def capitalize(word)
        word[0].upcase + word[1..-1].downcase || word.upcase
    end

    def name
        @name.split(" ").map!{|word| capitalize(word)}.join(" ")
    end

    def room_exists?(name)
        @rooms.has_key?(name)
    end

    def check_in(person_name, room_name)
        if !room_exists?(room_name)
            p "sorry, room does not exist"
        else
            if @rooms[room_name].add_occupant(person_name)
                p "check in successful"
            else p "sorry, room is full"
            end
        end
    end

    def has_vacancy?
        !@rooms.all?{|name, room| room.full?}
    end

    def list_rooms
        @rooms.each {|name, room| puts name + room.available_space.to_s}
    end

end
