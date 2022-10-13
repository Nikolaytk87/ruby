require_relative 'train.rb'

module TrainMenu
  def create_train
    puts params_object_text["train"]
    number, type = gets.chomp.split(",")
    type = type.downcase.to_sym
    create_train_by_type(number, type)
    puts "Создан поезд с номером #{number}, типом #{type}"
  end

  def create_train_by_type(number, type)
    if type == :cargo
      CargoTrain.new(number)
    elsif type == :passenger
      PassengerTrain.new(number)
    end
  end

  def show_trains
    puts "Вывожу список всех поездов: "
    trains.each_key { |name| puts "Поезд №: #{name}" }
  end

  def input_operation_train
    puts "Укажите номер поезда с которым нужно будет производить действия"
    gets.chomp
  end

  def action_operation_train
    puts choise_operation_train_text
    gets.chomp
  end

  def operation_wagon(operation, train)
    show_wagon_numbers
    wagon_name = input_wagon_name
    wagon = wagons[wagon_name]
    if wagon && operation == "mount"
      train.add_wagon(wagon)
    elsif wagons && operation == "unmount"
      train.del_wagon(wagon)
    else
      puts "Такого вагона нет, создайте его"
    end
  end

  def operation_add_route(train)
    show_routes
    route_name = choice_route
    route = routes[route_name]
    train.add_route(route)
  end
end

def operation_train
  show_trains
  train_number = input_operation_train
  train = trains[train_number]
  if train
    action = action_operation_train
    choice_operation_train_menu(action, train)
  else
    puts "Поезда с таким номером нет"
  end
end

def operation_move(action, train)
  if action == "forward"
    train.move_forward
  else
    train.move_back
  end
end

def choice_operation_train_menu(action, train)
  case action
  when "1" then operation_wagon("mount", train)
  when "2" then operation_wagon("unmount", train)
  when "3" then operation_add_route(train)
  when "4" then operation_move("forward", train)
  when "5" then operation_move("back", train)
  end
end
