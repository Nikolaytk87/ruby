vowels_hash = {}
vowels = ["a", "e", "i", "o", "u", "y"]

vowels.each_with_index { |char, idx| vowels_hash[char] = idx.next }

puts vowels_hash
