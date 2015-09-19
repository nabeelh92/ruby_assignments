def bubble_sort(arr)
	n = arr.length

	loop do
		is_swapped = false

		(n-1).times do |i|
			if arr[i] > arr[i+1]
				arr[i], arr[i+1] = arr[i+1], arr[i]
				is_swapped = true
			end 
		end

		break if not is_swapped
	end

	arr
end


my_array = [4,3,78,2,0,2]
#my_array = [1,2,3,4]

puts "BEFORE bubble_sort is called, the array is #{my_array}"

bubble_sort(my_array)
puts "AFTER bubble_sort is called, the array is #{my_array}"