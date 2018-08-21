class Board
	@@board = "1|2|3\n4|5|6\n7|8|9"

	def board
		puts ""
		return @@board
	end	

	def self.place_x(num)
		@@board.sub!(num.to_s, "x")
	end
end

class Player
	def choose(num)
		Board.place_x(num)
	end	
end

game = Board.new
player = Player.new
puts game.board
puts game.board
player.choose(3)
puts game.board


