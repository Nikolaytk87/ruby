require_relative 'wagon_cargo.rb'
require_relative 'wagon_pass.rb'

module WagonMenu
  def create_wagon
    puts params_object_text["wagon"]
    number, type = gets.chomp.split(",")
    type = type.downcase.to_sym
    create_wagon_by_type(number, type)
    puts "Создан вагон с номером #{number}, типом #{type}"
  end

  def create_wagon_by_type(number, type)
    if type == :cargo
      volume = input_wagon_volume
      CargoWagon.new(number, volume)
    elsif type == :passenger
      seats = input_wagon_seats
      PassengerWagon.new(number, seats)
    end
  end

  def input_wagon_seats
    puts "Укажите количество пассажирских мест"
    gets.to_i
  end

  def input_wagon_volume
    puts "Укажите общий объем вагона"
    gets.to_f
  end

  def input_wagon_name
    puts "Укажите номер вагона"
    gets.chomp
  end

  def input_take_amount_volume
    puts "Укажите объем вагона, который необходимо занять"
    gets.chomp.to_f
  end

  def take_seat(wagon)
    wagon.take_seat
    puts "Место успешно занято"
  end

  def take_volume(wagon, amount_volume)
    wagon.take_volume(amount_volume)
    puts "Объем в количестве #{amount_volume} успешно занят"
  end

  def take_volume_or_seat(wagon, type)
    if type == :cargo
      amount_volume = input_take_amount_volume
      take_volume(wagon, amount_volume)
    elsif type == :passenger
      take_seat(wagon)
    end
  end

  def show_wagon
    puts "Показываю список вагонов"
    wagons.each { |wagon| puts "Вагон №: #{wagon.number}, Тип: #{wagon.type}" }
  end

  def get_wagon_by_number(number)
    wagons.find { |wagon| wagon.number == number }
  end

  def operation_wagon
    show_wagon
    number = input_wagon_name
    wagon = get_wagon_by_number(number)
    type = wagon.type
    take_volume_or_seat(wagon, type)
  end
end
