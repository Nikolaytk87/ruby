require_relative "wagon.rb"

class CargoWagon < Wagon
  attr_reader :volume, :empty_volume, :occupied_volume

  def initialize(number, volume)
    @volume = volume
    @empty_volume = volume
    @occupied_volume = 0
    @type = :cargo
    super
  end

  def take_volume(volume)
    self.empty_volume -= volume
    self.occupied_volume += volume
  end

  private

  attr_writer :empty_volume, :occupied_volume
end
