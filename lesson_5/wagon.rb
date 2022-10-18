require_relative 'manufacturer.rb'
class Wagon
  include Manufacturer
  @@wagons = []
  attr_reader :number, :type

  def self.wagons
    @@wagons
  end

  def initialize(number)
    @number = number
    @@wagons << self
  end
end
