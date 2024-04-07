def substring(string, dictionary)
    result=Hash.new(0)
    for i in dictionary do
        if (string.downcase.include?(i.downcase))
            result[i]+=1
        end
    end
    return result
end
# dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
dictionary=Array.new
puts "Enter 1 if you want to add a word ot the dictionary else 0"
response=gets.chomp.to_i
until response == 0
    response
    puts "Please enter a new word:"
    dictionary.push(gets.chomp)
    puts "Enter 1 if you want to add a word ot the dictionary else 0"
    response=gets.chomp.to_i  
end
puts "Enter main word"
main_word=gets.chomp

puts substring(main_word,dictionary)
# puts substring("below", dictionary)
# puts substring("Howdy partner, sit down! How's it going?", dictionary)

