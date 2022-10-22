require_relative 'instance_counter'
require_relative 'manufacturer'
require_relative 'validating'
class Train
  include Manufacturer
  include InstanceCounter
  include Validating
  @@trains = []
  attr_accessor :current_station, :speed, :route
  attr_reader :wagons, :number, :type

  def self.find(number)
    trains.find { |train| train.number == number }
  end

  def self.trains
    @@trains
  end

  def initialize(number)
    @number = number
    @speed = 0
    @wagons = []
    validate!
    @@trains << self
    register_instance
  end

  def validate!
    validate_exist(type, 'type')
    validate_exist(number, 'number')
    validate_length(number, 'number', min_length: 5)
    validate_train_number(number)
    validate_type(type)
    validate_train_number(number)
  end

  def getwagons(&block)
    wagons.each(&block)
  end

  def stop
    self.speed = 0
  end

  def add_wagon(wagon)
    wagons << wagon if wagon.type == type && speed.zero?
  end

  def del_wagon(wagon)
    wagons.delete(wagon) if wagon.type == type && speed.zero?
  end

  def add_route(route)
    self.route = route
    self.current_station = route.stations.first
    current_station.take_train(self)
  end

  def move_forward
    return unless next_station

    current_station.sending_train(self)
    self.current_station = next_station
    current_station.take_train(self)
  end

  def move_back
    return unless previous_station

    current_station.sending_train(self)
    self.current_station = previous_station
    current_station.take_train(self)
  end

  protected

  def previous_station
    previous_index = route.stations.index(current_station) - 1
    previous_station = route.stations[previous_index]
    previous_station if previous_index >= 0 && !previous_station.nil?
  end

  def next_station
    next_index = route.stations.index(current_station) + 1
    next_station = route.stations[next_index]
    next_station unless next_station.nil?
  end
end
