require_relative './menu/route_menu'
require_relative './menu/station_menu'
require_relative './menu/train_menu'
require_relative './other/display'

class Main
  include RouteMenu
  include StationMenu
  include TrainMenu
  include Display

  MAIN_MENU_LIST = [
    'операции со станциями',
    'операции с поездами',
    'операции с маршрутами'
  ].freeze

  def initialize
    @stations = []
    @trains = []
    @routes = []
    @carriages = []
  end

  def menu
    blank_line
    loop do
      display_menu(MAIN_MENU_LIST, true)
      case gets.to_i
      when 1 then station_manager
      when 2 then train_manager
      when 3 then route_manager
      when 0 then break
      else enter_another_value
      end
    end
  end
end

test = Main.new
test.menu
