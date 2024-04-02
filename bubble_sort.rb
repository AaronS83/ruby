def bubble_sort(array) 
    for  i in (0...array.length )
        for j in (0 ... array.length - i -1)
            if array[j] > array[j+1] 
                temp=array[j]
                array[j]=array[j+1]
                array[j+1]=temp
            end
        end
    end
    return array
end

# array=[4,3,7,8,2,0,2]

puts "Enter the number of elements you want to sort:"
n = gets.chomp.to_i
array = []
n.times do |i|
    puts  "Enter element #{i+1}"
    array.push(gets.chomp.to_i)
end
p bubble_sort(array) 