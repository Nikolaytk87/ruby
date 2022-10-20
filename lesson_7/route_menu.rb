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
    routes.each { |route| puts "Имя маршрута: #{route.name}" }
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

  def choice_operation_route_menu(choiced_route, station_name)
    puts "Введите add, если хотите добавить станцию #{station_name} в маршрут #{choiced_route}\n" \
         "Введите del, если хотите удалить станцию #{station_name} из маршрута #{choiced_route}"
    gets.chomp
  end

  def action_operation_route_menu(route, action, station_name)
    station = get_station_by_name(station_name)
    case action
    when "add"
      if station
        route.add_station(station)
      else
        puts "Такой станции нет"
      end
    when "del"
      route.del_station(station)
    end
  end

  def get_route_by_name(name)
    routes.find { |route| route.name == name }
  end

  def operation_route
    check_routes
    show_routes
    route_name = choice_route
    station_name = choice_station_name
    operation = choice_operation_route_menu(route_name, station_name)
    route = get_route_by_name(route_name)
    if route
      action_operation_route_menu(route, operation, station_name)
    else
      puts "Маршрута #{route_name} не существует"
    end
  end
end
