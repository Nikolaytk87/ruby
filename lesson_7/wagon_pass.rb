require_relative "wagon.rb"

class PassengerWagon < Wagon
  attr_reader :occupied_seats, :empty_seats, :seats

  def initialize(number, seats)
    @type = :passenger
    @seats = seats
    @occupied_seats = 0
    @empty_seats = seats
    super(number)
  end

  def take_seat
    self.empty_seats -= 1
    self.occupied_seats += 1
  end

  private

  attr_writer :occupied_seats, :empty_seats
end
