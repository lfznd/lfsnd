require_relative '../models/station'
require_relative '../other/display'
require_relative '../other/selectors'

module StationMenu
  include Selectors
  include Display

  STATIONS_MENU = [
    'создать станцию',
    'список станций и поездов на них'
  ].freeze

  ENTER_STATION_NAME = 'Введите название станции'.freeze
  NAME_ERROR_MESSAGE = 'Станция с таким именем уже существует'.freeze

  def station_manager
    blank_line
    loop do
      display_menu(STATIONS_MENU, true)
      case gets.to_i
      when 1 then new_station
      when 2 then trains_on_station
      when 0 then break
      else enter_another_value
      end
    end
  end

  def new_station
    puts ENTER_STATION_NAME
    name = gets
    return puts NAME_ERROR_MESSAGE, blank_line if station_exist?(name)

    @stations << Station.new(name)
    created_station(name)
  rescue StandartError => e
    puts e.message
    retry
  end

  def station_exist?(name)
    !!@stations.detect { |station| station.name == name }
  end

  def created_station(name)
    puts "Построена станция: #{name}"
  end
end
