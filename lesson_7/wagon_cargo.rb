require_relative "wagon.rb"
require_relative "validating.rb"

class CargoWagon < Wagon
  include Validating
  attr_reader :volume, :empty_volume, :occupied_volume

  def initialize(number, volume)
    @volume = volume
    @empty_volume = volume
    @occupied_volume = 0
    @type = :cargo
    super(number)
  end

  def take_volume(amount_of_volume)
    validate_empty_volume(amount_of_volume)
    self.empty_volume -= amount_of_volume
    self.occupied_volume += amount_of_volume
  end

  private

  attr_writer :empty_volume, :occupied_volume
end
