#finds longest item in array in n^2 time
def sluggish(fishes)

  fishes.each_with_index do |el1, idx1|
    longest_fish = true
    fishes.each_with_index do |el2, idx2|
      next if idx1 == idx2
      longest_fish = false if el1.length < el2.length
    end
    return el1 if longest_fish
  end

end

def dominant(fishes)
  merge_sort(fishes).last
end

def merge_sort(fishes)
  return fishes if fishes.length <= 1

  mid = fishes.length / 2

  left = merge_sort(fishes.take(mid))
  right = merge_sort(fishes.drop(mid))

  merge(left, right)
end

def merge(left, right)
  #merges two arrays into one sorted array
  merged = []

  until left.empty? || right.empty?
    if left.first.length < right.first.length
      merged << left.shift
    else
      merged << right.shift
    end
  end

  merged + left + right
end

def smart(fishes)
  longest_fish = ""

  fishes.each do |fish|
    longest_fish = fish if fish.length > longest_fish.length
  end

  longest_fish
end

def slow_dance(direction, tiles)
  tiles.each_with_index {|el, idx| return idx if el == direction}
end

new_tiles = {
  "up" => 0,
  "right-up" => 1,
  "right"=> 2,
  "right-down" => 3,
  "down" => 4,
  "left-down" => 5,
  "left" => 6,
  "left-up" => 7
}

def fast_dance(direction, new_tiles)
  new_tiles[direction]
end
