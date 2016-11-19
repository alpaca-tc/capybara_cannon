module CapybaraCannon
  autoload :OptionParser, 'capybara_cannon/option_parser'

  def self.start(argv)
    options = CapybaraCannon::OptionParser.new.parse(argv)
    CapybaraCannon::Cannon.new(options).evaluate
  end
end
