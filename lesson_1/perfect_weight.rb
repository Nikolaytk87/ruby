puts "Enter your name: "
user_name = gets.chomp
puts "Enter your height: "
user_height = gets.chomp.to_i
perfect_weight = ((user_height - 110) * 1.15).round

puts perfect_weight <= 0 ? "Your weight is already optimal" : "#{user_name}, Your perfect weight is #{perfect_weight}"
