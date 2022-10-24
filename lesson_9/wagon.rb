require_relative 'manufacturer'
require_relative 'validating'
class Wagon
  include Manufacturer
  include Validating
  @@wagons = []
  attr_reader :number, :type

  def self.wagons
    @@wagons
  end

  def initialize(number)
    @number = number
    @@wagons << self
    validate!
  end

  def validate!
    validate_exist(type, 'type')
    validate_exist(number, 'number')
    validate_length(number, 'number')
    validate_type(type)
  end
end
