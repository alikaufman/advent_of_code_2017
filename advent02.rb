require 'rspec'

module Day2
	def solve_first( input_file )
		sum = 0

		File.open( input_file, "r" ) do |f|
  			f.each_line do |line|
    			num_arr = line.split.map( &:to_i )
    			min = num_arr.min
    			max = num_arr.max
    			sum += max - min
    		end
  		end

  		sum
	end
	
	module_function :solve_first
end

RSpec.describe( Day2 ) do

	it "Part 1" do
		expect( Day2.solve_first( 'test_data.txt' ) ).to eq( 18 )
	end

end