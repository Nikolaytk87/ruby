require_relative 'train'

module TrainMenu
  def create_train
    attempt = 0
    begin
      puts params_object_text['train']
      number, type = gets.gsub(/\s/, '').split(',')
      validate_exist(type, 'type')
      validate_exist(number, 'type')
      type = type.downcase.to_sym
      validate_type(type)
      create_train_by_type(number, type)
      puts "Создан поезд с номером #{number}, типом #{type}"
    rescue ArgumentError, TypeError => e
      attempt += 1
      puts "Exception: #{e.message}"
      retry if attempt < 5
    end
  end

  def create_train_by_type(number, type)
    case type
    when :cargo then CargoTrain.new(number)
    when :passenger then PassengerTrain.new(number)
    end
  end

  def get_train_by_number(number)
    trains.find { |train| train.number == number }
  end

  def show_trains
    puts 'Вывожу список всех поездов: '
    trains.each { |train| puts "Поезд №: #{train.number} Тип поезда: #{train.type}" }
  end

  def input_train
    puts 'Укажите номер поезда'
    gets.chomp
  end

  def action_operation_train
    puts choise_operation_train_text
    gets.chomp
  end

  def action_on_wagon(operation, train)
    show_wagon
    wagon_number = input_wagon_name
    wagon = get_wagon_by_number(wagon_number)
    if wagon
      case operation
      when 'mount' then train.add_wagon(wagon)
      when 'unmount'then train.del_wagon(wagon)
      else puts "Не удалось распознать операцию: #{operation}"
      end
    else
      puts "Вагона с  номером #{wagon_number} не существует"
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

  def show_list_wagons_by_train
    show_trains
    train = get_train_by_number(input_train)
    train.getwagons do |wagon|
      msg = "Номер вагона: #{wagon.number}, Тип вагона: #{wagon.type}"
      case wagon.type
      when :cargo
        puts msg + " Кол-во свободного объема: #{wagon.empty_volume}, Кол-во занятого объема: #{wagon.occupied_volume}"
      when :passenger
        puts msg + " Кол-во свободных место: #{wagon.empty_seats}, Кол-во занятых мест: #{wagon.occupied_seats}"
      end
    end
  end

  def operation_train
    show_trains
    train_number = input_train
    train = get_train_by_number(train_number)
    if train
      action = action_operation_train
      choice_operation_train_menu(action, train)
    else
      puts "Поезда с номером #{train_number} нет"
    end
  end

  def operation_move(action, train)
    if action == 'forward'
      train.move_forward
    else
      train.move_back
    end
  end

  def choice_operation_train_menu(action, train)
    case action
    when '1' then action_on_wagon('mount', train)
    when '2' then action_on_wagon('unmount', train)
    when '3' then operation_add_route(train)
    when '4' then operation_move('forward', train)
    when '5' then operation_move('back', train)
    else
      puts "Такого выбора #{action} нет."
    end
  end
end
