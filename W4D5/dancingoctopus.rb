def slow_dance(dir, arr)
    hash = Hash.new
    arr.each.with_index do |ele, idx|
        hash[ele] = idx
    end
    hash[dir]
end

def fast_dance(dir, tiles_hash)
    tiles_hash[dir]
end

tiles_array = ["up", "right-up", "right", "right-down", 
    "down", "left-down", "left",  "left-up" ]
    
p slow_dance("up", tiles_array)
p slow_dance("right-down", tiles_array)

tiles_hash = {"up" => 0, "right-up" => 1, "right" => 2, "right-down" => 3, 
    "down" => 4, "left-down" => 5, "left" => 6,  "left-up" => 7}

p fast_dance("up", tiles_hash)
p fast_dance("right-down", tiles_hash)