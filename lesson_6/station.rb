require_relative 'instance_counter.rb'
class Station
  include InstanceCounter
  @@stations = []
  attr_accessor :trains
  attr_reader :name

  def self.all
    @@stations
  end

  def initialize(name)
    @name = name
    @trains = { cargo: [], passenger: [] }
    @@stations << self
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
