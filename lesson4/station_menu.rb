require_relative 'station.rb'

module StationMenu
  def create_station(station_name = nil)
    if station_name.nil?
      puts params_object_text["station"]
      station_name = gets.chomp
    end
    station = Station.new(station_name)
    puts "Создана станция: #{station_name} \n #{station.inspect}"
    station
  end

  def show_stations_by_route(route)
    if route.instance_of? Route
      route.stations.each { |station| puts station.inspect }
    else
      puts "Такого маршрута #{route} нет"
    end
  end

  def get_station_by_name(name)
    stations[name]
  end

  def show_stations
    puts "Список станций:"
    stations.each_key { |name| puts name }
  end

  def show_list_stations
    puts "Список станций:"
    stations.each_key { |name| puts name }
  end

  def choice_show_station
    puts "Введите станцию на которой хотите посмотреть список поездов"
    gets.chomp
  end

  def show_list_trains_by_station
    show_stations
    station_name = choice_show_station
    station = stations[station_name]
    unless station.nil?
      puts "Список поездов на станции #{station_name}:"
      puts "Грузовые поезда:"
      station.trains_by_type(:cargo).each { |train| puts train.number }
      puts "Пассажирские поезда:"
      station.trains_by_type(:passenger).each { |train| puts train.number }
    else
      puts "Такой станции #{station} нет"
    end
  end

  def choice_station_name
    puts "Введите название станции с которой хотите выполнить операцию"
    gets.chomp
  end

  def get_station(station_name)
    station = stations[station_name]
    if station
      return station
    else
      create_station(station_name)
    end
  end
end
