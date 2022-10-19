require_relative "wagon.rb"

class CargoWagon < Wagon
  def initialize(number)
    @type = :cargo
    super
  end
end
