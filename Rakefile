require "bundler/gem_tasks"
require "brawn/version"
task :default => :spec

task :bi do
  `gem build brawn.gemspec`
  `gem install brawn-#{Brawn::VERSION}.gem --local`
end