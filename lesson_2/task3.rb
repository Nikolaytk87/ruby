fibonachi = [0, 1]
index = 0
fibonachi.each do |current_num|
  next_index = index + 1
  if fibonachi.last > 100
    fibonachi.delete_at(next_index)
    break
  end
  fibonachi << (current_num + fibonachi[next_index])
  index += 1
end

puts fibonachi
