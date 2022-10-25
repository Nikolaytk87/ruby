require_relative 'manufacturer'
require_relative 'validation'
class Wagon
  include Manufacturer
  include Validation
  @@wagons = []
  attr_reader :number, :type

  def self.wagons
    @@wagons
  end

  def initialize(number)
    @number = number
    validate!
    @@wagons << self
  end
end
