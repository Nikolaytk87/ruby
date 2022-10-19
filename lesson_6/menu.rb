require_relative 'route.rb'
require_relative 'station.rb'
require_relative 'train.rb'
require_relative 'train_cargo.rb'
require_relative 'train_pass.rb'
require_relative 'wagon.rb'
require_relative 'wagon_cargo.rb'
require_relative 'wagon_pass.rb'
require_relative 'wagon_menu.rb'
require_relative 'station_menu.rb'
require_relative 'train_menu.rb'
require_relative 'route_menu.rb'
require_relative 'texts.rb'
require_relative 'validating.rb'

class Menu < Texts
  attr_accessor :wagons, :trains, :stations, :routes

  include WagonMenu
  include StationMenu
  include RouteMenu
  include TrainMenu
  include Validating
  def initialize
    @wagons = Wagon.wagons
    @stations = Station.all
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
    else
      puts "Такого выбора #{object} нет."
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
    else
      puts "Такого выбора #{object_name} нет."
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
    when "0" then show_stations
    when "1" then show_list_trains_by_station
    else
      puts "Такого выбора #{user_choise} нет."
    end
  end

  def exit_menu
    puts buy_text
  end
end
