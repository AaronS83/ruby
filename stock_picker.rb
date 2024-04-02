require 'pry-byebug'
def stock_picker(days) 
    front = 0
    last = 1
    max = 0
    while last<days.length do
        buy_price = days[front]
        sell_price = days[last]
        if  (sell_price - buy_price > max)
            max = sell_price - buy_price 
            max_front = front
            max_last = last
            last+=1
        else
            if sell_price<buy_price
                front=last
                last+=1
            else
                last+=1
            end
        end
        # binding.pry
        # puts  "Front: #{front}, Last: #{last}"
        # puts "Buy_price: #{buy_price}, sell_price: #{sell_price}"
        # puts  "max_front: #{max_front}, max_Last: #{max_last}"
        # puts "Max: #{max}"
        # puts
    end
    return [max_front,max_last]
end


# p stock_picker([17,3,6,9,15,8,6,1,10])
p stock_picker([19,13,10,5,3,6,4,2,1])