require_relative "wagon.rb"
require_relative "validating.rb"

class PassengerWagon < Wagon
  include Validating
  attr_reader :occupied_seats, :empty_seats, :seats

  def initialize(number, seats)
    @type = :passenger
    @seats = seats
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
