require_relative "wagon.rb"

class CargoWagon < Wagon
  def initialize(number)
    super
    @type = :cargo
  end
end
