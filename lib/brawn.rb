require 'net/ssh'
require 'net/scp'
require 'table_print'
require 'hooray'

require "brawn/version"
require "brawn/commands_generator"

module Brawn 
  ROOT_DIR = Pathname.new(File.expand_path('../..', __FILE__))
  ASSETS_DIR = ROOT_DIR.join("assets/")

  class CLILauncher
    def self.launch
      Brawn::CommandsGenerator.start
    end
  end
end
