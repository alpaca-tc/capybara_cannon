require 'optparse'

module CapybaraCannon
  class OptionParser
    def initialize
      @options = {}
    end

    def parse(args)
      option_parser.parse!(args.clone)
      @options
    end

    private

    def option_parser
      ::OptionParser.new do |parser|
        parser.banner = <<~BANNER
        BANNER

        parser.on('--file FILE') do |file|
          file = File.expand_path(file)
          raise ArgumentError, "missing file(#{file})" unless File.exists?(file)
          @options[:file] = File.expand_path(file)
        end
      end
    end
  end
end
