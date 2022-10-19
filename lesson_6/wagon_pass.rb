require_relative "wagon.rb"

class PassengerWagon < Wagon
  def initialize(number)
    @type = :passenger
    super(number)
  end
end
