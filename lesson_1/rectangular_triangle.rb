puts "Enter three sides 'a,b,c' comma-separated of the triangle(Example: 5,5,15): "
sides_triangle = gets.chomp.split(",")

a, b, c = sides_triangle.map(&:to_i).sort

if a == b && b == c
  puts "Triangle equilateral and isosceles"
elsif a == b || b == c
  puts "Triangle isosceles"
elsif (a**2) + (b**2) == c**2
  puts "Triangle rectangular"
end
