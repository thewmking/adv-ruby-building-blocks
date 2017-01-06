#for each element in the list, compare it and the element directly to its right.
#if out of order, swap elements. repeat.

def bubble_sort(array)
  n = array.length - 1
  loop do
    swapped = false

    (n).times do |i|
      if array[i] > array[i+1]
        array[i], array[i+1] = array[i+1], array[i]
        swapped = true
      end
    end

    break if not swapped
  end

puts array
end


bubble_sort([9,2,1,3,5,6,7])


def bubble_sort_by(array)
  n = array.length - 1
    loop do
      swapped = false

      (n).times do |i|
        if yield(array[i], array[i+1]) > 0
          array[i], array[i+1] = array[i+1], array[i]
          swapped = true
        end
      end

      break if not swapped
    end

    puts array
end

bubble_sort_by(["hi", "hello", "hey"]) do |left, right|
	left.length - right.length
end
