class Station
  attr_accessor :trains
  attr_reader :name

  def initialize(name)
    @name = name
    @trains = { cargo: [], passenger: [] }
  end

  def trains_by_type(type)
    trains[type.to_sym]
  end

  def sending_train(train)
    self.trains[train.type.to_sym].delete(train)
  end

  def take_train(train)
    self.trains[train.type.to_sym] << train
  end
end

class Route
  attr_reader :stations

  def initialize(first_station, last_station)
    @first_station = first_station
    @last_station = last_station
    @intermediate_stations = []
    @stations = [first_station, last_station]
  end

  def add_station(station)
    @stations.insert(-2, station)
  end

  def del_station(station)
    stations.delete(station)
  end
end

class Train
  attr_accessor :speed, :current_station, :route
  attr_reader :wagons, :type, :number

  def initialize(number, type, wagons)
    @number = number
    @type = type
    @wagons = wagons.to_i
    @type = type
    @speed = 0
  end

  def stop
    self.speed = 0
  end

  def pull_wagon
    @wagons -= 1 if speed == 0
  end

  def push_wagon
    @wagons += 1 if speed == 0
  end

  def add_route(route)
    self.route = route
    self.current_station = route.stations.first
    self.current_station.take_train(self)
  end

  def previous_station
    previous_index = route.stations.index(current_station) - 1
    previous_station = route.stations[previous_index]
    if previous_index >= 0 && (not previous_station.nil?)
      previous_station
    end
  end

  def next_station
    next_index = route.stations.index(current_station) + 1
    next_station = route.stations[next_index]
    if not next_station.nil?
      next_station
    end
  end

  def move_forward
    if next_station
      self.current_station.sending_train(self)
      self.current_station = next_station
      self.current_station.take_train(self)
    end
  end

  def move_back
    if previous_station
      self.current_station.sending_train(self)
      self.current_station = previous_station
      self.current_station.take_train(self)
    end
  end
end
