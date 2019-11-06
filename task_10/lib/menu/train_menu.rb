require_relative '../models/train'
require_relative '../models/pass_train'
require_relative '../models/cargo_train'
require_relative '../models/station'
require_relative 'carriage_menu'
require_relative '../other/display'
require_relative '../other/selectors'

module TrainMenu
  include CarriageMenu
  include Selectors
  include Display

  TRAINS_MENU = [
    'создать поезд',
    'операции с вагонами',
    'перемещение поезда по маршруту',
    'список вагонов поезда'
  ].freeze

  NEW_TRAIN_TYPES = %w[грузовой пассажирский].freeze

  TRAINS_MOVE_MENU = ['на следующую станцию', 'на предыдущую станцию'].freeze

  ENTER_NUMBER_OF_TRAIN = 'Введите номер поезда в пятизначном формате'.freeze
  TRAIN_EXIST_MESSAGE = 'Поезд под таким номером уже существует'.freeze

  def train_manager
    blank_line
    loop do
      display_menu(TRAINS_MENU, true)
      case gets.to_i
      when 1 then new_train
      when 2 then carriage_manager
      when 3 then train_move
      when 4 then show_train_carriages(select_train)
      when 0 then break
      else enter_another_value
      end
    end
  end

  def new_train
    puts ENTER_NUMBER_OF_TRAIN
    number = gets.chomp
    return puts TRAIN_EXIST_MESSAGE, blank_line if train_exist?(number)

    new_train_by_type(number)
    created_train_message(number)
  rescue StandardError => e
    puts e.message
    retry
  end

  def new_train_by_type(number)
    display_menu(NEW_TRAIN_TYPES, true)
    case gets.to_i
    when 1 then @trains << CargoTrain.new(number)
    when 2 then @trains << PassTrain.new(number)
    else enter_another_value
    end
  end

  def train_move
    train = select_train
    loop do
      display_menu(TRAINS_MOVE_MENU, true)
      case gets.to_i
      when 1 then train.move_next && next_station_info(train)
      when 2 then train.move_previous && previous_station_info(train)
      else break
      end
    end
  end

  def train_exist?(number)
    !!@trains.detect { |train| train.number == number }
  end

  def next_station_info(train)
    puts "Станция - #{train.station.name}"
    puts "Следующая станция - #{train.next_station.name}" unless train.next_station.nil?
    puts 'Конечная' if train.next_station.nil?
  end

  def previous_station_info(train)
    puts "Станция - #{train.station.name}"
    puts "Следующая станция - #{train.previous_station.name}" unless train.previous_station.nil?
    puts 'Конечная' if train.previous_station.nil?
  end

  def created_train_message(number)
    blank_line
    puts "Создан поезд под номером #{number}"
    blank_line
  end
end
