require_relative 'wagon_cargo.rb'
require_relative 'wagon_pass.rb'

module WagonMenu
  def create_wagon
    puts params_object_text["wagon"]
    number, type = gets.chomp.split(",")
    type = type.downcase.to_sym
    wagon = create_wagon_by_type(number, type)
    wagons[number] = wagon
    puts "Создан вагон с номером #{number}, типом #{type}"
  end

  def create_wagon_by_type(number, type)
    if type == :cargo
      CargoWagon.new(number)
    elsif type == :passenger
      PassengerWagon.new(number)
    end
  end

  def input_wagon_name
    puts "Укажите номер вагона"
    gets.chomp
  end

  def show_wagon_numbers
    puts "Показываю список вагонов"
    wagons.each_key { |number| puts "Вагон №: #{number}" }
  end
end
