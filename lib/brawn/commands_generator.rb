require 'commander'
require 'brawn/exploiter'
require 'brawn/scanner'
require 'brawn/version'

module Brawn
  class CommandsGenerator
    include Commander::Methods

    def self.start
      self.new.run
    end

    def run
      program :name, "brawn"
      program :version, Brawn::VERSION

      program :description, "Bunch of weird network utilities to troll jailbroken iPhones"
      program :help, 'Author', 'Jurvis Tan <hello@jurvis.co>'
      program :help_formatter, :compact

      command :scan do |c|
        c.syntax = 'brawn scan <network_addr>'
        c.description = "Returns a list of iOS devices in network with SSH open with default credentials"

        c.action do |args, options|
          Brawn::Scanner.new.run args.first
      	end
      end

      command :exploit do |c|
        c.syntax = 'brawn exploit <ip_addr>'
        c.description = "Exploit an iOS device with the given IP address"
        c.action do |args, options|
          Brawn::Exploiter.new.run args.first
        end
      end

      default_command :help

      run! 
    end
  end
end