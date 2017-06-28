require "bundler/gem_tasks"
require "bruteios/version"
task :default => :spec

task :bi do
  `gem build bruteios.gemspec`
  `gem install bruteios-#{Bruteios::VERSION}.gem --local`
end