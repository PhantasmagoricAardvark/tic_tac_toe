class Board
	@@board = "1|2|3\n4|5|6\n7|8|9"
	@@options = [1,2,3,4,5,6,7,8,9]
	@@x_s = []
	@@o_s = []
	@@victories = [[1,2,3],[1,4,7],[1,5,9],[2,5,8],[3,5,7],[3,6,9],[4,5,6],[7,8,9]]

	def self.options
		@@options
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

	def self.player_victory
			@@victories.each { |el|
				i = 0
				counter = 0
				while i < 3
					if @@x_s.include?(el[i])
						counter += 1
					end
					i += 1
					if counter == 3
						return true
					end
				end
			}
			false
	end	

	def self.computer_victory
			@@victories.each { |el|
				i = 0
				counter = 0
				while i < 3
					if @@o_s.include?(el[i])
						counter += 1
					end
					i += 1
					if counter == 3
						return true
					end
				end
			}
			false
	end	

end

class Player
	def choose
		puts "Make your choice."
		num = gets.chomp.to_i
		until Board.options.include?(num)
			puts Board.options.include?(num)
			puts "That spot has already been taken."
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
	def self.play_game
		puts "Tic. Tac. Toe!"
		puts "You are the x's."
		puts "The computer plays with the o's."
		puts "To make your choice type a number."
		game = Board.new
		player = Player.new
		computer = Computer.new
		puts "The board:"
		puts game.board
		while 1
			puts
			player.choose
			if Board.player_victory
				puts game.board
				puts
				puts "You win!"
				break
			elsif Board.options.length == 0
				puts
				puts game.board
				puts "It's a draw!"
				break
			end
			computer.choose
			puts game.board
			if Board.computer_victory
				puts
				puts "Computer wins!"
				break
			end
		end
	end
end

Moderator.play_game




