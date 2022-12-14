require_relative 'instance_counter'
require_relative 'validation'
require_relative 'accessors'
class Station
  include InstanceCounter
  include Validation
  include Accessors
  @@stations = []
  attr_accessor :trains
  attr_reader :name

  attr_accessor_with_history :station_room
  strong_attr_accessor :amount_of_room, Integer

  validate :name, :presence
  validate :name, :type, String
  validate :name, :format, /^[a-z]{3,10}-?[a-z0-9]{0,2}$/i

  def self.all
    @@stations
  end

  def initialize(name)
    @name = name
    validate!
    @trains = { cargo: [], passenger: [] }
    @@stations << self
  end

  def gettrains(&block)
    trains.values.flatten.each(&block)
  end

  def trains_by_type(type)
    trains[type]
  end

  def train_type(train)
    if train.instance_of? CargoTrain
      :cargo
    elsif train.instance_of? PassengerTrain
      :passenger
    end
  end

  def sending_train(train)
    trains[train_type(train)].delete(train)
  end

  def take_train(train)
    trains[train_type(train)] << train
  end
end
