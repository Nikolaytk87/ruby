require_relative 'wagon'
require_relative 'validating'

class PassengerWagon < Wagon
  include Validating
  attr_reader :occupied_seats, :empty_seats, :seats

  def initialize(number, options = {})
    @type = :passenger
    @seats = options[:seats] || 78
    @occupied_seats = 0
    @empty_seats = seats
    super(number)
  end

  def take_seat
    validate_empty_seats
    self.empty_seats -= 1
    self.occupied_seats += 1
  end

  private

  attr_writer :occupied_seats, :empty_seats
end
