require 'pry-byebug'
def caesar_cipher(string, shift_factor)
    result= ""
    for i in string.chars do
        if (i ==  " ") 
            result<<i 
            next
        end
        if (i =~ /[A-Z]/) 
            res = (i.ord - "A".ord) + shift_factor
            res %=26 if res>26
            temp_string = (res+"A".ord).chr
        else
            res = (i.ord - "a".ord) + shift_factor
            res %=26 if res>26
            temp_string = (res+"a".ord).chr
        end
        # binding.pry
        result<<temp_string 
    end
    return result
end

puts "Enter your string"
str = gets.chomp
puts "Enter the shift"
shift = gets.chomp.to_i
puts caesar_cipher(str,shift)

# better answer
#     def translate(message, shift, result = '')
#       message.each_char do |char|
#         base = char.ord < 91 ? 65 : 97
#         # Modifies Lowercase & Uppercase
#         if char.ord.between?(65, 90) || char.ord.between?(97, 122)
#           rotation = (((char.ord - base) + shift) % 26) + base
#           result += rotation.chr
#         # Keeps spaces & punctuation
#         else
#           result += char
#         end
#       end
#       result
#     end
#   end