class Wagon
  @@wagons = {}
  attr_reader :number, :type

  def self.wagons
    @@wagons
  end

  def initialize(number)
    @number = number
    @@wagons[number] = self
  end
end
