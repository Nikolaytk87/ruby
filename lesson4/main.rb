require_relative 'route.rb'
require_relative 'station.rb'
require_relative 'train.rb'
require_relative 'train_cargo.rb'
require_relative 'train_pass.rb'
require_relative 'wagon.rb'
require_relative 'wagon_cargo.rb'
require_relative 'wagon_pass.rb'
require_relative 'wagon_menu.rb'
require_relative 'station_menu'
require_relative 'train_menu'
require_relative 'route_menu'
module Texts
  def start_choise_text
    "Введите 1, если вы хотите создать станцию, поезд, вагон или маршрут\n" \
      "Введите 2, если вы хотите произвести операции с созданными объектами\n" \
      "Введите 3, если вы хотите вывести текущие данные о объекте\n" \
      "Введите 0, если хотите закончить программу"
  end

  def choise_not_found_text
    "Вы не выбрали нужный пункт меню"
  end

  def choise_operation_train_text
    "Введите 1, если вы хотите добавить вагон в поезд\n" \
      "Введите 2, если вы хотите отцепить вагон от поезда\n" \
      "Введите 3, если вы хотите назначить маршрут поезду\n" \
      "Введите 4, если вы хотите переместить поезд на следующую станцию\n" \
      "Введите 5, если вы хотите переместить  поезд на предыдущую станцию"
  end

  def buy_text
    "Программа успешно завершена"
  end

  def back_menu_text
    "Введите 0, если хотите закончить программу\n" \
      "Введите 1, если хотите вернуться в главное меню"
  end

  def create_object_text
    "Введите название объекта, который вы хотите создать(station, train, wagon, route)"
  end

  def params_object_text
    {
      "station" => "Введите название станции",
      "wagon" => "Введите номер вагона и его тип(cargo или passenger) через запятую (KT345OL,passenger)",
      "train" => "Введите номер поезда и его тип(cargo или passenger)через запятую (Lastochka,passenger)",
      "route" => "Введите первую и последнюю станцию маршрута через запятую (moskva,kaluga)"
    }
  end

  def choise_show_text
    "Введите 0, если хотите посмотреть список станций\n" \
      "Введите 1, если хотите посмотреть список поездов на станции"
  end

  def choise_object_operations_text
    "Введите название объекта, над которым вы хотите произвести операцию(train, route)"
  end
end

class Menu
  attr_accessor :wagons, :trains, :stations, :routes

  include Texts
  include WagonMenu
  include StationMenu
  include RouteMenu
  include TrainMenu
  def initialize
    @wagons = Wagon.wagons
    @stations = Station.stations
    @trains = Train.trains
    @routes = Route.routes
  end

  def main_menu
    action = start_choise
    case action
    when "0"then exit_menu
    when "1" then create_menu
    when "2" then operations_menu
    when "3" then show_menu
    else puts choise_not_found_text
    end
  end

  def start_choise
    puts start_choise_text
    gets.chomp
  end

  def create_menu
    puts create_object_text
    object = gets.chomp
    choice_create_menu(object)
    back_menu
  end

  def back_menu
    puts back_menu_text
    choice = gets.chomp
    case choice
    when "0" then exit_menu
    when "1" then main_menu
    end
  end

  def choice_create_menu(object)
    case object
    when "train" then create_train
    when "wagon" then create_wagon
    when "station" then create_station
    when "route" then create_route
    end
  end

  def operations_menu
    puts choise_object_operations_text
    object_name = gets.chomp
    choice_operations_menu(object_name)
    back_menu
  end

  def choice_operations_menu(object_name)
    case object_name
    when "train" then operation_train
    when "route" then operation_route
    end
  end

  def show_menu
    puts choise_show_text
    user_choise = gets.chomp
    choice_show_menu(user_choise)
    back_menu
  end

  def choice_show_menu(user_choise)
    case user_choise
    when "0" then show_list_stations
    when "1" then show_list_trains_by_station
    end
  end

  def exit_menu
    puts buy_text
  end
end
