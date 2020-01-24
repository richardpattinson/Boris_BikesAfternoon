require_relative 'bike'

class DockingStation
    DEFAULT_CAPACITY = 20
    attr_reader :bikes , :capacity
    def initialize(capacity = DEFAULT_CAPACITY) 
        @bikes = []
        @capacity = capacity

    end

    def release_bike
        fail 'Station is empty!' if @bikes.empty?
        @bikes.pop
    end

    def dock(bike)
        fail 'Station is full' if full?
        @bikes.push(bike)
        return @bikes.last
    end

    private
    def full?
        if @bikes.length >= DEFAULT_CAPACITY
            true
        else
            false
        end
    end

end