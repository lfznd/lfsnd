# Load RSpec and Capybara
require 'rspec'
require 'capybara/rspec'
require 'capybara/dsl'
require 'byebug'

page_paths  = File.join(Dir.pwd, 'spec', '**', '*.rb')
Dir.glob(page_paths).each { |file| require file }


# Configure RSpec
RSpec.configure do |config|
  # Mixin the Capybara functionality into Rspec
  config.include Capybara::DSL
  config.order = 'default'

  
end

Capybara.register_driver :chrome do |app|
Capybara::Selenium::Driver.new(app, browser: :chrome)

end

Capybara.default_driver = :chrome
Capybara.app_host = 'https://cross-edit-staging-frontend.herokuapp.com'
Capybara.default_max_wait_time = 20

