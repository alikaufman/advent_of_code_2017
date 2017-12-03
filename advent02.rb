require 'rspec'

module Day2

	module_function

	def solve_first( input_file )
		sum = 0

		File.open( input_file, "r" ) do |f|
  			f.each_line do |line|
    			num_arr = line.split.map( &:to_i )
    			sum += num_arr.max - num_arr.min
    		end
  		end

  		return sum
	end
	
	def solve_second( input_file )
		sum = 0

		File.open( input_file, "r" ) do |f|
  			f.each_line do |line|
    			num_arr = line.split.map( &:to_i ).sort { |x,y| y <=> x }.combination(2).to_a

    			num_arr.each do |num_set|
    				if num_set[0]%num_set[1] == 0
    					sum += num_set[0]/num_set[1]
    				end
    			end
    		end
  		end

  		return sum
	end
end

RSpec.describe( Day2 ) do

	context "solve_first" do
		
		it "returns 18 for 'test_data.txt'" do
			expect( Day2.solve_first( 'test_data.txt' ) ).to eq( 18 )
		end
	
	end


	context "solve_second" do

		it "returns 9 for 'test_data02.txt'" do
			expect( Day2.solve_second( 'test_data02.txt' ) ).to eq( 9 )
		end
	end

end