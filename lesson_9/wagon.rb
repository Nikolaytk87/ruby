require_relative 'manufacturer'
require_relative 'validation'
require_relative 'accessors'
class Wagon
  include Manufacturer
  include Validation
  include Accessors
  @@wagons = []
  attr_reader :number, :type

  strong_attr_accessor :wheel, Integer

  def self.wagons
    @@wagons
  end

  def initialize(number)
    @number = number
    validate!
    @@wagons << self
  end
end
