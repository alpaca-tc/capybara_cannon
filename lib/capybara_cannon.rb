module CapybaraCannon
  autoload :OptionParser, 'capybara_cannon/option_parser'
  autoload :Cannon, 'capybara_cannon/cannon'
  autoload :Evaluator, 'capybara_cannon/evaluator'

  def self.start(argv)
    CapybaraCannon::OptionParser.new.parse(argv)
    CapybaraCannon::Cannon.new.evaluate
  end

  def self.configuration
    @configuration ||= {}
  end
end
