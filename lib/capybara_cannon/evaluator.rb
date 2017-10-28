require 'capybara'
require 'capybara/dsl'
require 'capybara/poltergeist'
require 'selenium-webdriver'

module CapybaraCannon
  class Evaluator
    include Capybara::DSL
    extend Forwardable

    def_delegators :driver, :cookies, :remove_cookie, :set_cookie, :cookies

    def initialize
      Capybara.run_server = false
      Capybara.default_driver = :poltergeist
    end

    def current_session
      Capybara.current_session
    end

    def driver
      current_session.driver
    end

    def header(*args)
      if driver.respond_to?(:add_header)
        driver.add_header(*args)
      else
        driver.header(*args)
      end
    end

    private

    def method_missing(action, *args)
      configuration_method = "#{action}=".to_sym

      if Capybara.current_session.respond_to?(action)
        # Capybara.current_sessionに移譲する
        #
        # g.u
        #   `driver.header('User-Agent', 'Mozilla/5.0...')`
        Capybara.current_session.public_send(action, *args)
      elsif configuration_respond_to?(configuration_method)
        # Capybara.configure(&block) で定義できるようなメソッドは移譲する
        # g.u
        #   `app_host('https://example.com')` #=> Capybara.configure(&:itself).app_host = 'https://example.com'
        configuration(configuration_method, *args)
      elsif Capybara.respond_to?(action)
        Capybara.public_send(action, *args)
      else
        super
      end
    end

    def configuration_respond_to?(action)
      configuration_methods = Capybara.configure(&:itself).methods.grep(/\w=$/)
      configuration_methods.include?(action)
    end

    def configuration(action, *args)
      Capybara.configure do |config|
        config.public_send(action, *args)
      end
    end
  end
end
