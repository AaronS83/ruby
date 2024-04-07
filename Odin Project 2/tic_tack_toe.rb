require 'pry-byebug'
class Board
    attr_accessor :t_board
    def initialize
        @t_board = Array.new(3) {Array.new(3,"-")}
    end

    def display
        @t_board.each do |row|
            row.each do |column|
                putc "#{column} "
            end
            puts
        end
    end 

    def t_board_action(x, y, symbol)
        # binding.pry
        @t_board[x][y]=symbol
    end
end

class Player
    attr_accessor :win, :name
    attr_reader :symbol

    def initialize(symbol, name)
        @win = false
        @symbol = symbol
        @name = name
    end
    
    def action(board)

        loop do    
            puts "\n#{name}, enter your move (e.g. 1,2 for row,column): "
            result = gets.chomp.split(',')
            # binding.pry
            x=result[0].to_i - 1
            y=result[1].to_i - 1
            if valid?(x,y,board)
                board.t_board_action(x, y, symbol)
                break
            else
                puts "Invalid Input, please try again."
            end
        end
    end

    def valid?(x,y,board)
        return true if x.between?(0,2)  && y.between?(0,2) && board.t_board[x][y] == "-"
        return false
    end

    def check_win? (board)
        rows = board.t_board
        column = rows.transpose
        diagonals = [[rows[0][0] , rows[1][1], rows [2][2]], [rows[0][2] , rows[1][1], rows[2] [0]]]
        [rows,column,diagonals].any? do |line|
            line.any? do |l|
                l.uniq.length == 1 && l[0]==symbol
            end
        end
    end
end


ttt = Board.new

player_1 = Player.new("X", "Aaron")
player_2 = Player.new("O", "Bob")

until (player_1.check_win?(ttt) || player_2.check_win?(ttt) )
    player_1.action(ttt)
    ttt.display
    # puts
    break if player_1.check_win?(ttt)
    player_2.action(ttt)
    ttt.display
    # binding.pry
    # binding.pry
    # binding.pry
end

puts "#{player_1.name} wins" if  player_1.check_win?(ttt)
puts "#{player_2.name} wins"  if player_2.check_win?(ttt)

# inspiration

# class Board
#     attr_accessor :t_board
  
#     def initialize
#       @t_board = Array.new(3) { Array.new(3, "-") }
#     end
  
#     def display
#       @t_board.each do |row|
#         row.each do |column|
#           print "#{column} "
#         end
#         puts
#       end
#     end
  
#     def place_symbol(x, y, symbol)
#       @t_board[x][y] = symbol
#     end
#   end
  
#   class Player
#     attr_reader :symbol, :name
  
#     def initialize(symbol, name)
#       @symbol = symbol
#       @name = name
#     end
  
#     def make_move(board)
#       loop do
#         puts "#{name}, enter your move (e.g. 1,2 for row,column): "
        # input = gets.chomp.split(',')
        # x = input[0].to_i - 1
        # y = input[1].to_i - 1
#         if valid_move?(x, y, board)
#           board.place_symbol(x, y, symbol)
#           break
#         else
#           puts "Invalid move. Please try again."
#         end
#       end
#     end
  
#     def valid_move?(x, y, board)
#       x.between?(0, 2) && y.between?(0, 2) && board.t_board[x][y] == '-'
#     end
  
#     def win?(board)
#       # Check rows
#       board.t_board.each do |row|
#         return true if row.uniq.length == 1 && row[0] == symbol
#       end
#       # Check columns
#       board.t_board.transpose.each do |col|
#         return true if col.uniq.length == 1 && col[0] == symbol
#       end
#       # Check diagonals
#       diagonals = [
#         [board.t_board[0][0], board.t_board[1][1], board.t_board[2][2]],
#         [board.t_board[0][2], board.t_board[1][1], board.t_board[2][0]]
#       ]
#       diagonals.each do |diag|
#         return true if diag.uniq.length == 1 && diag[0] == symbol
#       end
#       false
#     end
#   end
  
#   # Game loop
#   ttt = Board.new
#   player_1 = Player.new("X", "Aaron")
#   player_2 = Player.new("O", "Bob")
  
#   until player_1.win?(ttt) || player_2.win?(ttt)
#     ttt.display
#     player_1.make_move(ttt)
#     break if player_1.win?(ttt)
#     ttt.display
#     player_2.make_move(ttt)
#   end
  
#   ttt.display
#   puts "#{player_1.name} wins!" if player_1.win?(ttt)
#   puts "#{player_2.name} wins!" if player_2.win?(ttt)
  