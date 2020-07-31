def sluggish_octopus(arr)
    biggest_fish = ''
    (0...arr.length - 1).each do |i|
        (i + 1...arr.length).each do |j|
            if arr[i].length > arr[j].length
                biggest_fish = arr[i]
            else
                biggest_fish = arr[j]
            end
        end
    end
    biggest_fish
end

def dominant_octopus(arr)
    merge_sort(arr)[-1]
end

def merge_sort(arr)
    return arr if arr.length <= 1

    middle = arr.length / 2
    left = arr[0...middle]
    right = arr[middle..-1]

    left_sorted = merge_sort(left)
    right_sorted = merge_sort(right)

    merge(left_sorted, right_sorted)
end

def merge(left, right)
    merged_arr = []

    while !left.empty? && !right.empty?
        if left[0].length < right[0].length
            merged_arr << left[0]
            left.shift
        else
            merged_arr << right[0]
            right.shift
        end
    end
    merged_arr + left + right
end


def clever_octopus(arr)
    max_length = 0
    biggest_fish = ""
    arr.each do|ele|  
        if ele.length > max_length
            max_length = ele.length
            biggest_fish = ele
        end
    end
    biggest_fish
end


fish_arr = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 
    'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
p sluggish_octopus(fish_arr)
p dominant_octopus(fish_arr)
p clever_octopus(fish_arr)