require_relative 'train.rb'

module TrainMenu
  def create_train
    puts params_object_text["train"]
    number, type = gets.chomp.split(",")
    unless number && type
      puts "Неверный формат ввода"
    else
      type = type.downcase.to_sym
      create_train_by_type(number, type)
      puts "Создан поезд с номером #{number}, типом #{type}"
    end
  end

  def create_train_by_type(number, type)
    if type == :cargo
      CargoTrain.new(number)
    elsif type == :passenger
      PassengerTrain.new(number)
    end
  end

  def get_train_by_number(number)
    trains.find { |train| train.number == number }
  end

  def show_trains
    puts "Вывожу список всех поездов: "
    trains.each { |train| puts "Поезд №: #{train.number}" }
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
    wagon_number = input_wagon_name
    wagon = get_wagon_by_number(wagon_number)
    unless wagon
      puts "Вагона с  номером #{wagon_number} не существует"
    else
      if operation == "mount"
        train.add_wagon(wagon)
      elsif operation == "unmount"
        train.del_wagon(wagon)
      else
        puts "Не удалось распознать операцию: #{operation}"
      end
    end
  end

  def operation_add_route(train)
    show_routes
    route_name = choice_route
    route = get_route_by_name(route_name)
    if route
      train.add_route(route)
      puts "Маршрут #{route.name} добавлен к поезду #{train.number}"
    else
      puts "Маршрута #{route_name} не существует"
    end
  end

  def operation_train
    show_trains
    train_number = input_operation_train
    train = get_train_by_number(train_number)
    if train
      action = action_operation_train
      choice_operation_train_menu(action, train)
    else
      puts "Поезда с номером #{train_number} нет"
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
    else
      puts "Такого выбора #{action} нет."
    end
  end
end
