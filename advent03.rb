require 'rspec'

module Day3

   module_function

   def solve_first( number )
      spiral = create_spiral_for_size( number )

      return steps_to_zero( spiral, number )
   end

   def create_spiral_for_size( grid_size )
      grid = [[0,0]]

      x = 0
      y = 0
      
      mover = 1
      counter = 1

      until grid.length >= grid_size do
         counter.times do 
            x += mover
            grid.push( [x,y] )
            break if grid.length == grid_size
         end

         next if grid.length == grid_size

         counter.times do 
            y += mover
            grid.push( [x,y] )
            break if grid.length == grid_size
         end

         mover *= -1
         counter += 1
      end

      return grid
   end

   def steps_to_zero( spiral, number )
      coordinates = spiral[number - 1]

      return coordinates[0].abs + coordinates[1].abs
   end

   def solve_second( number )
      grid = { [0,0] => 1 }

      x = 0
      y = 0
      
      mover = 1
      counter = 1
      value = 1

      while value < number do
         counter.times do 
            x += mover
            value = get_coordinate_value( [x,y], grid )
            grid[[x,y]] = value
            break if value > number
         end

         next if value >= number

         counter.times do 
            y += mover
            value = get_coordinate_value( [x,y], grid )
            grid[[x,y]] = value
            break if value > number
         end

         mover *= -1
         counter += 1
      end

      return grid.values.last
   end

   def get_coordinate_value( coordinates, grid )
      value = 0
      x = coordinates[0]
      y = coordinates[1]

      value += grid[[x+1, y]] if grid[[x+1, y]]
      value += grid[[x+1, y+1]] if grid[[x+1, y+1]]
      value += grid[[x+1, y-1]] if grid[[x+1, y-1]]
      value += grid[[x, y+1]] if grid[[x, y+1]]
      value += grid[[x, y-1]] if grid[[x, y-1]]
      value += grid[[x-1, y]] if grid[[x-1, y]]
      value += grid[[x-1, y+1]] if grid[[x-1, y+1]]
      value += grid[[x-1, y-1]] if grid[[x-1, y-1]]

      return value
   end
end


RSpec.describe( Day3 ) do

   context "Part 1" do

      it "1 returns 0" do
         expect( Day3.solve_first( 1 ) ).to eq( 0 )
      end


      it "12 returns 3" do
         expect( Day3.solve_first( 12 ) ).to eq( 3 )
      end


      it "23 returns 2" do
         expect( Day3.solve_first( 23 ) ).to eq( 2 )
      end


      it "1024 returns 31" do
         expect( Day3.solve_first( 1024 ) ).to eq( 31 )
      end

   end

   context "Part 2" do

      it "24 returns 25" do
         expect( Day3.solve_second( 24 ) ).to eq( 25 )
      end

      it "310 returns 330" do
         expect( Day3.solve_second( 310 ) ).to eq( 330 )
      end

      it "55 returns 57" do
         expect( Day3.solve_second( 55 ) ).to eq( 57 )
      end

      it "750 returns 806" do
         expect( Day3.solve_second( 750 ) ).to eq( 806 )
      end
   end

end