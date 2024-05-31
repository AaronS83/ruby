require 'yaml'

fp0 = File.open("words.txt","r")
dictionary = fp0.readlines

correct_word = false
until correct_word
    random_number = Random.rand(0 .. 9894)
    word = dictionary[random_number].chomp
    # puts word
    if word.length.between?(5,12)
        correct_word = true
        # word = dictionary[random_number]
    end
end

# puts
# puts word
fp0.close

word_split = word.split("")
class Player
    attr_accessor :name, :turn, :entered, :guess
    attr_reader :word, :id
    @@id = 0

    def initialize(name, word, guess=Array.new(word.length,"-"), turn=6, entered=Array.new)
        @name = name
        @guess = guess
        @turn = turn
        @entered = entered
        @word = word
    end

    def player_turn(char)
        if word.index(char)
            elements = word.each_index.select { |index| word[index] == char}
            # puts elements
            puts "Correct guess"
            for i in elements
                guess[i] = char
            end
            # guess[word.index(char)] = char
            entered.push(char) 
            # p guess
        else
            self.turn-=1
            entered.push(char)
            puts "Incorrect guess"
            puts "You have #{turn} guesses left"
        end
    end

    def win?
        return false if guess.index("-")
        return true
    end

    def to_YAML
        YAML.dump({
            :name => name,
            :guess => guess,
            :turn => turn,
            :entered => entered,
            :word => word
            # :id => id
        })
    end

    def self.from_YAML(string)
        read_data = YAML.load string
        self.new(read_data[:name],read_data[:word],read_data[:guess], read_data[:turn],read_data[:entered])
    end
end

def store_to_file(p1)
    serialized_YAML_object = p1.to_YAML
    fp = File.open("p0","w")
    fp.write(serialized_YAML_object)
    fp.close
end

def read_from_file
    
    # p read_object
end 

p1 = Player.new("Aaron", word_split)

until p1.turn == 0 || p1.win?
    puts "Enter Your choice:
        1- Continue playing #{p1.guess}
        2- Save the current game status (Current progress will be lost)
        3- Load the game status(always assumed that it exists)"
    choice = gets.chomp.to_i
    puts

    case choice
    when 1
        p p1.guess
        print "Enter the character: "
        character = gets.chomp
        p1.player_turn(character)
        puts
    when 2
        store_to_file(p1)
        break
    when 3
        fp1 = File.open("p0","r")
        p1 = Player.from_YAML(fp1.read)
        puts "You have read from file"
        puts "#{p1.turn} are the turns left"
        puts "#{p1.entered} are the entered letters"
        puts "#{p1.guess} is the progress of the game"
        puts
        fp1.close
    else
        puts "You entered the wrong element"
        puts "The correct thing to enter is 1, 2 or 3"
        puts
    end
end

if p1.win? 
    puts
    puts "_______________________________________________________"
    puts "Congrats, you have won !!!"
    puts "Your guesses #{p1.entered}"
    puts "The correct word was #{word}"
elsif p1.turn == 0
    puts
    puts "_______________________________________________________"
    puts "Sorry, you have lost"
    puts "Your guesses #{p1.entered}"
    puts "The correct word was #{word}"
else
    puts "You decided to store it to a file"
end
















# until p1.turn == 0 || p1.win?
    
#     puts
#     p p1.guess
#     print "Enter the character: "
#     character = gets.chomp
#     p1.player_turn(character)
# end





