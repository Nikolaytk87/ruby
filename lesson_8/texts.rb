class Texts
  def start_choise_text
    "Введите 1, если вы хотите создать станцию, поезд, вагон или маршрут\n" \
      "Введите 2, если вы хотите произвести операции с созданными объектами\n" \
      "Введите 3, если вы хотите вывести текущие данные о объекте\n" \
      'Введите 0, если хотите закончить программу'
  end

  def choise_not_found_text
    'Вы не выбрали нужный пункт меню'
  end

  def choise_operation_train_text
    "Введите 1, если вы хотите добавить вагон в поезд\n" \
      "Введите 2, если вы хотите отцепить вагон от поезда\n" \
      "Введите 3, если вы хотите назначить маршрут поезду\n" \
      "Введите 4, если вы хотите переместить поезд на следующую станцию\n" \
      'Введите 5, если вы хотите переместить  поезд на предыдущую станцию'
  end

  def buy_text
    'Программа успешно завершена'
  end

  def back_menu_text
    "Введите 0, если хотите закончить программу\n" \
      'Введите 1, если хотите вернуться в главное меню'
  end

  def create_object_text
    'Введите название объекта, который вы хотите создать(station, train, wagon, route)'
  end

  def params_object_text
    {
      'station' => 'Введите название станции',
      'wagon' => 'Введите номер вагона и его тип(cargo или passenger) через запятую (KT45O,passenger)',
      'train' => 'Введите номер поезда и его тип(cargo или passenger)через запятую (Lastochka,passenger)',
      'route' => 'Введите первую и последнюю станцию маршрута через запятую (moskva,kaluga)'
    }
  end

  def choise_show_text
    "Введите 1, если хотите посмотреть список станций\n" \
      "Введите 2, если хотите посмотреть список поездов на станции\n" \
      'Введите 3, если хотите посмотреть список вагонов у поезда'
  end

  def choise_object_operations_text
    'Введите название объекта, над которым вы хотите произвести операцию(train, route, wagon)'
  end
end