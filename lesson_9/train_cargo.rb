require_relative 'train'

class CargoTrain < Train
  include Validation

  validate :number, :presence
  validate :type, :presence
  validate :type, :format, /^cargo$/
  validate :number, :format, /\A[a-zа-я0-9]{3}-?[a-zа-я0-9]{2}\z/i
  validate :number, :type, String
  validate :type, :type, Symbol

  def initialize(number, type: :cargo)
    @type = type
    super(number)
  end
end
