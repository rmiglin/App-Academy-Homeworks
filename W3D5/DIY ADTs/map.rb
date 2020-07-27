class Map
    def initialize
        @map = Array.new{Array.new}
    end

    def set(key, value)
        @map.each do |ele|
            if ele[0] == key
                ele = [key, value]
                return
            end
        end
        @map << [key, value]
    end

    def get(key)
        @map.each do |ele|
            if ele[0] == key
                return value
            end
        end
    end

    def delete(key)
        i = 0
        while i < @map.length
            if @map[i][0] == key
                @map.delete(@map[i][0])
                return
            end
            i += 1
        end
    end

    def show
        @map.each{|ele| print "#{ele} "}
    end

end