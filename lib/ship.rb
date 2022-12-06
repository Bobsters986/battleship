class Ship
    attr_reader :name, :length, :starting_health

    def initialize(name, length)
        @name = name
        @length = length
        @starting_health = 0
    end

    def health
        @starting_health + @length
    end

    def sunk?
        if health == 0 
            true
        else
            false
        end
    end

    def hit
        @starting_health -= 1
    end
end