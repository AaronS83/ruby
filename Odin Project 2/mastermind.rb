require 'pry-byebug'
class Board
    @@row=0
    attr_accessor :board, :indicator
    def initialize
        @board = Array.new(8) {Array.new(4)}
        @indicator = Array.new(8) {Array.new(4)}
    end

    def indicator(column, value)
        # binding.pry
        @indicator[@@row][column] = value
    end

    def place_piece(col, piece)
        @board[@@row][col]=piece
    end

    # def display_board
    #     @board.each do |r| 
    #         r.each do |c|
    #             putc "#{c} " unless r[0] == nil
    #         end
    #     end
    #     putc "  "
    # end
    def display_board
        @board.each do |r| 
            p r unless r[0] == nil
        end
    end

    # def display_indicator
    #     @indicator.each do |r| 
    #         r.each do |c|
    #             putc "#{c} " unless r[0] == nil
    #         end
    #     end
    #     puts
    # end
    def display_indicator
        @indicator.each do |r| 
            p r unless r[0] == nil
        end
    end

    def self.end_turn
        @@row+=1
    end

    def self.row
        @@row
    end

    def has_won?(p1)
        p1.win = true if @indicator[@@row].uniq.length == 1 && @indicator[@@row][0]==2
        # binding.pry
    end
end

class Encoder
    attr_accessor :name
    def initialize(name, strng)
        @name = name
        @result = strng
    end

    def check(b)
        b.board[Board.row].each_with_index do |value,column|
            # binding.pry
            if @result[column] == value
                b.indicator(column,2)
            elsif @result.include?(value)
                b.indicator(column,1)
            else
                b.indicator(column, 0)
            end
        end
    end
end

    
    

class Decoder
    attr_accessor :win , :name
    def initialize (name)
        @name = name
        @win = false
    end

    def turn(board)
        print "#{@name}, enter 4 letter string (R,G,B,Y,W,O) in any combination seperated by space "
        res = gets.chomp.split(" ")
        # binding.pry
        4.times do |i|
            board.place_piece(i,res[i])
        end    
    end

    
end

def play (p1,p2,b)
    p1.turn(b)
    puts
    p2.check(b)
    b.has_won?(p1)
    Board.end_turn
    puts
    b.display_board
    b.display_indicator
end

puts "Enter then name of the Encoder"
name = gets.chomp
puts "Enter the Encoded 4 letter string (R,G,B,Y,W,O) in any combination without space"
code = gets.chomp.upcase
p2 = Encoder.new(name,code)

puts
puts "Enter then name of the decoder"
name = gets.chomp
p1 = Decoder.new(name)

b = Board.new

i=0

while i<8 && !p1.win
play(p1,p2,b)
end

if p1.win
    puts "#{p1.name }, has managed to decode the pattern #{p2.name} encoded"
else
    puts "#{p1.name }, could not decode the pattern #{p2.name} encoded"
end

# binding.pry