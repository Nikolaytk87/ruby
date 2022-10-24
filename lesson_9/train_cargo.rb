require_relative 'train'
require_relative 'validation'

class CargoTrain < Train
  include Validation

  validate :number, :presence
  validate :number, :presence
  validate :type, :presence
  validate :type, :format, /^cargo$|^passenger$/
  validate :number, :format, /[A-Z]{2,3}/
  validate :number, :type, String
  validate :type, :type, Symbol
  validate :number, :type, String
  validate :type, :type, Symbol
  def initialize(number)
    @type = :cargo
    super(number)
  end
end
