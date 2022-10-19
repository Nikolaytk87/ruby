require_relative 'instance_counter.rb'
require_relative 'validating.rb'
require_relative 'station.rb'
class Route
  include InstanceCounter
  include Validating
  @@routes = []
  attr_reader :stations
  attr_accessor :name

  def self.routes
    @@routes
  end

  def initialize(first_station, last_station)
    @first_station = first_station
    @last_station = last_station
    @stations = [first_station, last_station]
    validate!
    @name = "#{first_station.name}_#{last_station.name}"
    @@routes << self
  end

  def validate!
    stations.each { |station| validate_class_membership(station, Station) }
  end

  def add_station(station)
    stations.insert(-2, station)
  end

  def del_station(station)
    stations.delete(station)
  end
end
