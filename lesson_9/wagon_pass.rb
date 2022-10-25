require_relative 'wagon'
require_relative 'validation'

class PassengerWagon < Wagon
  include Validation
  attr_reader :occupied_seats, :empty_seats, :seats

  validate :number, :presence
  validate :type, :presence
  validate :type, :format, /^passenger$/
  validate :number, :format, /\A[a-zа-я0-9]{3}-?[a-zа-я0-9]{2}\z/i
  validate :number, :type, String
  validate :type, :type, Symbol

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
