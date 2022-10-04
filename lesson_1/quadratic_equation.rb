puts "Enter 3 coeficents a,b,c comma-separated(Example: 5,5,15): "
coeficents = gets.chomp.split(",")

a, b, c = coeficents.map(&:to_i)

discriminant = (b**2) - (4 * a * c)

if discriminant < 0
  puts "Discriminant: #{discriminant}, There are no roots of the quadratic equation"
elsif discriminant > 0
  x1 = (-b + Math.sqrt(discriminant)) / (2 * a)
  x2 = (-b - Math.sqrt(discriminant)) / (2 * a)
  puts "Discriminant: #{discriminant}, root1: #{x1} and root2: #{x2}"
elsif discriminant == 0
  x = -b / (2 * a)
  puts "Discriminant: #{discriminant}, root: #{x}"
end
