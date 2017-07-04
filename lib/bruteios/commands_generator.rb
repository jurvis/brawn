require 'commander'
require 'bruteios/scanner'
require 'bruteios/version'

module Bruteios
  class CommandsGenerator
    include Commander::Methods

    def self.start
      self.new.run
    end

    def run
      program :name, "bruteios"
      program :version, Bruteios::VERSION

      program :description, "Bunch of weird network utilities to troll jailbroken iPhones"
      program :help, 'Author', 'Jurvis Tan <hello@jurvis.co>'
      program :help_formatter, :compact

      command :scan do |c|
        c.syntax = 'bruteios scan <network_addr>'
        c.description = "Returns a list of iOS devices in network with SSH open with default credentials"

        c.action do |args, options|
          Bruteios::Scanner.new.run args.first
        end
      end

      default_command :help

      run! 
    end
  end
end