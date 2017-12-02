def solve_second( input )
	number_arr = input.split( // )
	len = number_arr.count
	matcher = len/2
	sum = 0
	counter = 0

	begin
	   	first_num = number_arr[ counter ].to_i
		second_num = number_arr[ counter + matcher ].to_i
		if first_num == second_num
			add_to = first_num + second_num
			sum += add_to
		end
	   counter +=1
	end while counter < number_arr.count

	return sum
end


def solve_first( input )
	number_arr = input.split(//)
	sum = 0
	counter = -1

	begin
	   if number_arr[counter] == number_arr[counter + 1]
	   		sum += number_arr[counter].to_i
	   end
	   counter +=1
	end while counter < number_arr.count

	return sum
end