require 'hooray'

module Bruteios
  class Scanner
    def run
      puts "Scanning for Devices in Network..."
      puts Hooray::Seek.new(network, port, protocol).nodes
    end
  end
end