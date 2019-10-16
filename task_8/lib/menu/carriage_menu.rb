require_relative '../models/carriage'
require_relative '../models/cargo_carriage'
require_relative '../models/pass_carriage'
require_relative '../models/train'
require_relative '../other/display'
require_relative '../other/selectors'

module CarriageMenu
  include Selectors
  include Display

  CARRIAGE_MENU = [
    'прицепить вагон',
    'отцепить вагон',
    'занять место в вагоне'
  ].freeze

  ENTER_CARRIAGE_NUMBER = 'Введите номер вагона'.freeze
  ENTER_CARRIAGE_VOLUME = 'Введите объём грузового вагона'.freeze
  ENTER_CARRIAGE_SEATS = 'Введите количество мест в вагоне'.freeze
  ENTER_VALUE_OF_VOLUME = 'Введите величину объёма, которую хотите забронировать'.freeze
  SEAT_TAKEN_MESSAGE = 'Место успешно забронировано'.freeze
  VOLUME_TAKEN_MESSAGE = 'Объём успешно забронирован'.freeze

  def carriage_manager
    loop do
      display_menu(CARRIAGE_MENU, true)
      case gets.to_i
      when 1 then add_carriage(select_train)
      when 2 then remove_carriage(select_train)
      when 3 then take_carriage_place(select_train)
      when 0 then break
      else enter_another_value
      end
    end
  end

  def create_carriage(train, number)
    puts train.type == :cargo ? ENTER_CARRIAGE_VOLUME : ENTER_CARRIAGE_SEATS
    volume = gets.to_i
    train.type == :cargo ? CargoCarriage.new(number, volume) : PassCarriage.new(number, volume)
  rescue StandardError => e
    puts e.message
    retry
  end

  def add_carriage(train)
    puts ENTER_CARRIAGE_NUMBER
    number = gets.to_i
    carriage = create_carriage(train, number)
    train.add_carriage(carriage)
    @carriages << carriage
  end

  def remove_carriage(train)
    carriage = select_carriage(train)
    train.remove_carriage(carriage)
    show_train_carriages(train)
  end

  def take_carriage_place(train)
    carriage = select_carriage(train)
    taken_place_message(carriage) if take_place_method(carriage)
  rescue StandardError => e
    puts e.message
    retry
  end

  def take_place_method(carriage)
    if carriage.is_a?(CargoCarriage)
      puts ENTER_VALUE_OF_VOLUME
      place = gets.to_i
      carriage.occupy_place(place)
    else
      carriage.occupy_place
    end
  end

  def taken_place_message(carriage)
    puts carriage.type == :cargo ? VOLUME_TAKEN_MESSAGE : SEAT_TAKEN_MESSAGE
    carriage_info(carriage)
  end

  def place_info(type)
    if type == :cargo
      { free_place: 'свободно объёма', occupied_place: 'занято объёма' }
    else
      { free_place: 'свободно мест', occupied_place: 'занято мест' }
    end
  end
end
