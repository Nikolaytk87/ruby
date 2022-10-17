require_relative 'counter.rb'
class Route
  include InstanceCounter
  @@routes = {}
  attr_reader :stations
  attr_accessor :name

  def self.routes
    @@routes
  end

  def initialize(first_station, last_station)
    @first_station = first_station
    @last_station = last_station
    @stations = [first_station, last_station]
    @name = "#{first_station.name}_#{last_station.name}"
    @@routes[name] = self
  end

  def add_station(station)
    stations.insert(-2, station)
  end

  def del_station(station)
    stations.delete(station)
  end
end
