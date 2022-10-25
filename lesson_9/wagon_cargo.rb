require_relative 'wagon'
require_relative 'validation'

class CargoWagon < Wagon
  include Validation
  attr_reader :volume, :empty_volume, :occupied_volume

  validate :number, :presence
  validate :type, :presence
  validate :type, :format, /^cargo$/
  validate :number, :format, /\A[a-zа-я0-9]{3}-?[a-zа-я0-9]{2}\z/i
  validate :number, :type, String
  validate :type, :type, Symbol

  def initialize(number, options = {})
    @volume = options[:volume] || 60
    @empty_volume = @volume
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
