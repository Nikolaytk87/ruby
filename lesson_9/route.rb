require_relative 'instance_counter'
require_relative 'station'
require_relative 'validation'
class Route
  include InstanceCounter
  include Validation
  @@routes = []
  attr_reader :stations, :first_station, :last_station
  attr_accessor :name

  validate :first_station, :type, Station
  validate :last_station, :type, Station

  def self.routes
    @@routes
  end

  def initialize(first_station, last_station)
    @first_station = first_station
    @last_station = last_station
    validate!
    @stations = [first_station, last_station]
    @name = "#{first_station.name}_#{last_station.name}"
    @@routes << self
  end

  def add_station(station)
    stations.insert(-2, station)
  end

  def del_station(station)
    stations.delete(station)
  end
end
