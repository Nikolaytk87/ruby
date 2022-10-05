fibonachi = [0, 1]
fibonachi.each_with_index do |current_num, idx|
  if fibonachi.last > 100
    fibonachi.delete_at(idx.next)
    break
  end
  fibonachi << (current_num + fibonachi[idx.next])
end

puts fibonachi
