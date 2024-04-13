require 'csv'
require 'date'
data = CSV.open('event_attendees.csv', headers: true, header_converters: :symbol)

def count_frequency (array)
    array.max_by { |a| array.count(a)}
end

# data_size = CSV.read('event_attendees.csv').length
# hour = Array.new(data_size)
# day = Array.new(data_size)

hour=[]
day=[]

j=0
data.each do |row|
    reg_date = row[:regdate]
    reg_date_obj =  DateTime.strptime(reg_date,"%m/%d/%y %H:%M")
    # hour[j]= reg_date_obj.hour
    # day[j] = reg_date_obj.wday
    
    hour << reg_date_obj.hour
    day << reg_date_obj.wday
    
    j+=1
end

most_frequent_hour = count_frequency(hour)
most_frequent_day = Date::DAYNAMES[count_frequency(day)].capitalize

puts "The most frequent hour = #{most_frequent_hour}"
puts "The most frequent day = #{most_frequent_day}"