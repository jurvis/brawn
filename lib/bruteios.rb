require 'net/ssh'
require 'table_print'
require 'hooray'

require "bruteios/version"
require "bruteios/commands_generator"

module Bruteios
  class CLILauncher
    def self.launch
      Bruteios::CommandsGenerator.start
    end
  end
end
