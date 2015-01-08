# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  gem.name = "mass_mandrill"
  gem.homepage = "https://github.com/trisignia/mass_mandrill"
  gem.license = "MIT"
  gem.summary = %Q{Send Mandrill emails}
  gem.description = %Q{Send Mandrill template emails}
  gem.email = "nebojsa.stricevic@gmail.com"
  gem.authors = ["Trisignia", "Nebojša Stričević"]
  # dependencies defined in Gemfile
end
Jeweler::RubygemsDotOrgTasks.new

require 'rspec/core'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList['spec/**/*_spec.rb']
end

task :default => :spec

require 'rdoc/task'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "mass_mandrill #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

require "mass_mandrill"

namespace :test do
  desc "Send test email"
  task :send_email, [:email] do |t, args|
    MassMandrill::TestMailer.test_email(args[:email]).deliver
  end
end
