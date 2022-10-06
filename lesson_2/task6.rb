items = Hash.new()
amount = Hash.new()
total = 0

loop do
  puts "Enter the product:"
  item_name = gets.chomp.to_sym
  break if item_name.to_s == "stop"

  puts "Enter the price of the item:"
  item_price = gets.to_f
  puts "Enter the product quantity:"
  item_quantity = gets.to_i

  amount_per_item = item_price * item_quantity
  total += amount_per_item
  amount[item_name] = amount_per_item
  items[item_name] = { item_price => item_quantity }

  puts "Enter next item...\n "
end

puts "Items: #{items} \nAmount: #{amount} \nTotal: #{total}"
