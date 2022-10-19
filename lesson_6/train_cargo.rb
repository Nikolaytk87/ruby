require_relative 'train.rb'

class CargoTrain < Train
  def initialize(number)
    @type = :cargo
    super(number)
  end
end
