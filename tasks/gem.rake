require 'rubygems/package_task'
require 'hoe'

HOE = Hoe.spec 'mysql' do
  self.rubyforge_name = 'mysql-win'
  self.author         = ['TOMITA Masahiro', 'Kevin Williams', 'Luis Lavena']
  self.email          = %w[tommy@tmtm.org kevwil@gmail.com luislavena@gmail.com]
  self.need_tar       = false
  self.need_zip       = false

  spec_extras[:required_ruby_version] = Gem::Requirement.new('> 1.8.5')

  spec_extras[:extensions] = ["ext/mysql/extconf.rb"]

  extra_dev_deps << ['rake-compiler', "~> 0.5.0"]
end

file "#{HOE.spec.name}.gemspec" => ['Rakefile', 'tasks/gem.rake'] do |t|
  puts "Generating #{t.name}"
  File.open(t.name, 'w') { |f| f.puts HOE.spec.to_yaml }
end

desc "Generate or update the standalone gemspec file for the project"
task :gemspec => ["#{HOE.spec.name}.gemspec"]
