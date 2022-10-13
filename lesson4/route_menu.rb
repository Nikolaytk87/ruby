require_relative 'route.rb'
module RouteMenu
  def create_route
    puts "Создаем первую станцию маршрута"
    first_station = create_station
    puts "Создаем последнюю станцию маршрута"
    last_station = create_station
    route = Route.new(first_station, last_station)

    puts "Создан маршрут #{route.name}"
  end

  def show_routes
    puts "Список маршрутов:"
    routes.each_key { |name| puts "Имя маршрута: #{name}" }
  end

  def check_routes
    if routes.empty?
      puts "Маршруты отсутствуют!\nСоздайте маршрут"
      create_route
    end
  end

  def choice_route
    puts "Введите название маршрута над которым хотите совершить операцию"
    gets.chomp
  end

  def choice_operation_route_menu(choiced_route, station)
    puts "Введите add, если хотите добавить станцию #{station} в маршрут #{choiced_route}\n" \
         "Введите del, если хотите удалить станцию #{station} из маршрута #{choiced_route}"
    gets.chomp
  end

  def action_operation_route_menu(route, action, station_name)
    case action
    when "add"
      station = get_station(station_name)
      route.add_station(station)
    when "del"
      route.del_station(stations[station_name])
    end
  end

  def get_route_by_name(name)
    routes[name]
  end

  def operation_route
    check_routes
    show_routes
    route_name = choice_route
    station_name = choice_station_name
    operation = choice_operation_route_menu(route_name, station_name)
    route = get_route_by_name(route_name)
    action_operation_route_menu(route, operation, station_name)

    # добавлять станции в маршрут
    # удалять станции из маршрута
  end
end
