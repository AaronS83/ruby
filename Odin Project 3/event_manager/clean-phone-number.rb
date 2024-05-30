require 'csv'
data = CSV.open('event_attendees.csv', headers:  true, header_converters: :symbol)

def clean_phone_number(phone_no)
    cleaned_number = phone_no.tr('()-.','').gsub(/\s/, '') # Removes all the shit like () and -
    if (cleaned_number.length == 10 || (cleaned_number.length == 11 && cleaned_number[0] == "1"))
        "phone number is valid"
    else
        "phone number is invalid"
    end
end

data.each do |line|
    phone_no = line[:homephone]
    name = line[:first_name]
    puts "#{name}'s #{clean_phone_number(phone_no)}"
end