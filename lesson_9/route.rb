require_relative 'instance_counter'
require_relative 'station'
require_relative 'validation'
require_relative 'accessors'
class Route
  include InstanceCounter
  include Validation
  include Accessors
  @@routes = []
  attr_reader :stations, :first_station, :last_station
  attr_accessor :name

  attr_accessor_with_history :advanced_route

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
