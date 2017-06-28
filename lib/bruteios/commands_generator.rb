require 'commander'
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
        c.syntax = 'bruteios scan'
        c.description = "Returns a list of iPhones in network with SSH open with default credentials"

        c.action do |args, options|
          Bruteios::Scanner.new.run
        end
      end

      default_command :help

      run! 
    end
  end
end