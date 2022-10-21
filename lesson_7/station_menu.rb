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
    stations.find { |station| station.name == name }
  end

  def show_stations
    puts "Список станций:"
    stations.each { |station| puts station.name }
  end

  def choice_show_station
    puts "Введите станцию на которой хотите посмотреть список поездов"
    gets.chomp
  end

  def show_list_trains_by_station
    show_stations
    station_name = choice_show_station
    station = get_station_by_name(station_name)
    unless station.nil?
      puts "Список поездов на станции #{station_name}:"
      station.gettrains { |train|
        puts "Номер поезда: #{train.number} Тип поезда: #{train.type} Количество вагонов: #{train.wagons.size}"
      }
    else
      puts "Такой станции #{station} нет"
    end
  end

  def choice_station_name
    puts "Введите название станции с которой хотите выполнить операцию"
    gets.chomp
  end
end
