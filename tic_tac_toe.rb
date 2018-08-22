class Board
	@@board = "1|2|3\n4|5|6\n7|8|9"
	@@options = [1,2,3,4,5,6,7,8,9]
	@@x_s = []
	@@o_s = []
	@@victories = [[1,2,3],[1,4,7],[1,5,9],[2,5,8],[3,5,7],[3,6,9],[4,5,6],[7,8,9]]

	def self.options
		@@options
	end

	def self.x
		@@x_s
	end

	def self.o
		@@o_s
	end

	def board
		puts ""
		return @@board
	end

	def self.place_x(num)
		@@options.delete(num.to_i)
		@@x_s.push(num)
		@@board.sub!(num.to_s, "x")
	end

	def self.place_o(num)
		@@options.delete(num.to_i)
		@@o_s.push(num)
		@@board.sub!(num.to_s, "o")
	end

	def victory
		i = 0
		while i < 1
			@@victories.each { |el|
				
			}
			i += 1
		end
	end	
end

class Player
	def choose
		puts
		puts "Make your choice."
		num = gets.chomp.to_i
		until Board.options.include?(num)
			puts Board.options.include?(num)
			puts "That number has already been taken."
			num = gets.chomp.to_i
		end
		Board.place_x(num)
	end	
end

class Computer
	def choose
		puts
		num = rand(1...10) 
		until Board.options.include?(num)
			num = rand(1...10)
		end
		Board.place_o(num)
		puts "computer placed o on #{num}"
	end
end

class Moderator
	def play_game
		
	end
end


game = Board.new
player = Player.new
computer = Computer.new
puts game.board
computer.choose
puts game.board
player.choose
puts game.board
p Board.options
p "x's" + Board.x.to_s
p "o's" + Board.o.to_s





