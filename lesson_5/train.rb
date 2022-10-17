class Train
  @@trains = {}
  attr_accessor :current_station, :speed, :route
  attr_reader :wagons, :number, :type

  def self.trains
    @@trains
  end

  def initialize(number)
    @number = number
    @speed = 0
    @wagons = []
    @@trains[number] = self
  end

  def stop
    self.speed = 0
  end

  def add_wagon(wagon)
    wagons << wagon if wagon.type == self.type && speed.zero?
  end

  def del_wagon(wagon)
    wagons.delete(wagon) if wagon.type == self.type && speed.zero?
  end

  def add_route(route)
    self.route = route
    self.current_station = route.stations.first
    current_station.take_train(self)
  end

  def move_forward
    if next_station
      current_station.sending_train(self)
      self.current_station = next_station
      current_station.take_train(self)
    end
  end

  def move_back
    if previous_station
      current_station.sending_train(self)
      self.current_station = previous_station
      current_station.take_train(self)
    end
  end

  protected

  # Отнес эти два метода к protected, так как они нужны для внутренних целей,
  # но будут использоваться у потомков

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
    unless next_station.nil?
      next_station
    end
  end
end
