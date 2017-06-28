require "bruteios/version"
require "bruteios/commands_generator"

module Bruteios
  class CLILauncher
    def launch
      Bruteios::CommandsGenerator.start
    end
  end
end
