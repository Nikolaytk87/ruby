require_relative "wagon.rb"

class PassengerWagon < Wagon
  attr_accessor :seats
  attr_reader :occupied_seats, :empty_seats

  def initialize(number, seats)
    @type = :passenger
    @seats = all_seats
    @occupied_seats = 0
    @empty_seats = seats
    super(number)
  end

  def take_seat
    self.empty_seats - 1
    self.occupied_seats + 1
  end

  protected

  attr_writer :occupied_seats, :empty_seats
end
