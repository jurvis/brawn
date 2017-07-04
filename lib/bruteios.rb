require 'net/ssh'
require 'net/scp'
require 'table_print'
require 'hooray'

require "bruteios/version"
require "bruteios/commands_generator"

module Bruteios
  ROOT_DIR = Pathname.new(File.expand_path('../..', __FILE__))
  ASSETS_DIR = ROOT_DIR.join("assets/")

  class CLILauncher
    def self.launch
      Bruteios::CommandsGenerator.start
    end
  end
end
