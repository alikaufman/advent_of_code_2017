require 'rspec'

module Day4
	
	module_function

	def solve_first( input_file )
		valid_count = 0

		File.open( input_file, "r" ).each do |phrase|
			valid_count += 1 if unique_passphrase?( phrase )
		end

		return valid_count
	end

	def unique_passphrase?( passphrase )
		arr = passphrase.split( " " )
		uniq_arr = arr.uniq

		return arr == uniq_arr
	end


	def solve_second( input_file )
		valid_count = 0

		File.open( input_file, "r" ).each do |phrase|
			valid_count += 1 if no_anagrams?( phrase )
		end

		return valid_count
	end

	def no_anagrams?( passphrase )
		arr = passphrase.split( " " )
		arr = arr.map{|word| word.split( // ).sort.join}
		uniq_arr = arr.uniq
		
		return arr == uniq_arr
	end
end

RSpec.describe( Day4 ) do
	
	context "Part 1" do
		
		it "returns 2 for 'day04_part01_input.txt'" do
			expect( Day4.solve_first( 'day04_part01_input.txt' ) ).to eq( 2 )
		end

	end


	context "Part 2" do

		it "returns 3 for 'day04_part01_input.txt'" do
			expect( Day4.solve_second( 'day04_part02_input.txt' ) ).to eq( 3 )
		end
		
	end
end