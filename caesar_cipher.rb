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
puts caesar_cipher("What a stRinG",5)
