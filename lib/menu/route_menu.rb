require_relative '../models/route'
require_relative '../other/display'
require_relative '../other/selectors'

module RouteMenu
  include Selectors
  include Display

  ROUTES_MENU = [
    'создать маршрут',
    'добавить станцию в маршрут',
    'убрать станцию из маршрута',
    'посмотреть маршруты',
    'назначить маршрут поезду'
  ].freeze

  SAME_STATIONS_ERROR = 'Маршрут не может состоять из одной и той же станции'.freeze
  DEPARTURE_STATION = 'Выберите станцию отправления'.freeze
  DESTINATION_STATION = 'Выберите станцию назначения'.freeze
  ALREADY_IN_ROUTE_MESSAGE = 'Данная станция есть в маршруте'.freeze
  NOT_IN_ROUTE_MESSAGE = 'Данной станции нет в маршруте'.freeze
  DELETE_ERROR_MESSAGE = 'Нельзя удалить начальную и конечную станции'.freeze
  DELETED_STATION_MESSAGE = 'Станция удалена из маршрута'.freeze

  def route_manager
    blank_line
    loop do
      display_menu(ROUTES_MENU, true)
      case gets.to_i
      when 1 then create_route
      when 2 then add_station_to_route
      when 3 then remove_station_from_route
      when 4 then show_routes
      when 5 then add_route
      when 0 then break
      else enter_another_value
      end
    end
  end

  def create_route
    puts DEPARTURE_STATION
    first_station = select_station
    puts DESTINATION_STATION
    last_station = select_station
    return puts SAME_STATIONS_ERROR, blank_line if first_station == last_station

    @routes << Route.new(first_station, last_station)
    route_created
  rescue StandardError => e
    puts e.message
  end

  def add_station_to_route
    route = select_route
    station = select_station
    if route.stations.include?(station)
      puts ALREADY_IN_ROUTE_MESSAGE
    else
      route.add_station(station)
      station_added_to_route
    end
  end

  def remove_station_from_route
    route = select_route
    station = select_station
    if [route.first_station, route.last_station].include?(station)
      puts DELETE_ERROR_MESSAGE
    elsif route.stations.include?(station)
      route.stations.delete(station)
      puts DELETED_STATION_MESSAGE
    else
      puts NOT_IN_ROUTE_MESSAGE
    end
  end

  def show_routes
    @routes.each.with_index(1) do |route, index|
      print "#{index}. Из #{route.stations[0].name} до #{route.stations[-1].name} \n"
    end
  end

  def add_route
    route = select_route
    train = select_train
    return if train.nil? || route.nil?

    train.add_route(route)
    puts "К поезду №#{train.number} добавлен маршрут от #{route.first_station.name} до #{route.last_station.name}"
  end

  def route_created
    blank_line
    puts 'Маршрут создан.'
  end

  def station_added_to_route
    blank_line
    puts 'Станция добавлена к маршруту'
  end
end
