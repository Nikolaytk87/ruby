puts "Input date as day.month.year (Example: 23.11.2022)"
user_date = gets.chomp
day, month, year = user_date.split(".").map { |date_item| date_item.to_i }

calendar = {
  january: 31,
  february: 28,
  march: 31,
  april: 30,
  may: 31,
  june: 30,
  july: 31,
  august: 31,
  september: 30,
  october: 31,
  november: 30,
  december: 31
}

def leep_year?(year)
  return true if (year % 4 == 0 && year % 100 != 0) || (year % 4 == 0 && year % 100 == 0 && year % 400 == 0)

  return false
end

def get_ordinal_number_of_day(month, day, year, calendar)
  calendar[:february] = 29 if leep_year?(year)
  all_days = 0
  calendar.values.each_with_index do |days, idx|
    break if idx.next == month

    all_days += days
  end
  return all_days + day
end

sequence_number = get_ordinal_number_of_day(month, day, year, calendar)

puts "Sequence number is #{sequence_number}"
