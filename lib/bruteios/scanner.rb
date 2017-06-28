module Bruteios 
  class Scanner
    def run
      puts "Scanning for Devices in Network..."
      nodes = Hooray::Seek.new('', '22', '').nodes
      puts "Found #{nodes.count} nodes"
      puts "Attempting SSH..."
      sshable_nodes = nodes.select { |node| can_ssh?(node) }
      puts "Found #{sshable_nodes.count} SSHable nodes"
      
      print_table(sshable_nodes)
    end

    private
    def print_table(nodes)
      return if nodes.empty?
      puts
      if nodes.first.ports.empty?
        tp nodes, :name, :ip, :mac
      else
        tp nodes, :name, :ip, :mac, :ports
      end
      puts '---'
      summary(nodes)
    end

    def summary(nodes)
      message = "#{nodes.count} device"
      message += 's' if  nodes.size > 1
      puts "#{message}"
    end
    
    def can_ssh?(node)
      ip_addr = node.ip.to_s
      puts "Attempting SSH on #{ip_addr}"
      begin
        Net::SSH.start(ip_addr, "root", :password => "alpine", :auth_methods => ["password"], :number_of_password_prompts => 0 ) do |ssh|
          return true
        end
      rescue Net::SSH::AuthenticationFailed => e
        return false
      rescue Net::SSH::Disconnect => e
        return false
      end 
    end
  end
end