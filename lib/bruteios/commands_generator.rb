require 'commander'
require 'bruteios/exploiter'
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

      command :exploit do |c|
	c.syntax = 'bruteios exploit <ip_addr>'
	c.description = "Exploit an iOS device with the given IP address"
	c.action do |args, options|
	  Bruteios::Exploiter.new.run args.first
	end
      end

      default_command :help

      run! 
    end
  end
end