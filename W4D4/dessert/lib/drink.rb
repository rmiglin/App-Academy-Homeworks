class Drink
    attr_reader :type
    def initialize(type)
        @type = type
    end

    def dip(drink)
        return drink
    end
end