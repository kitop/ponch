#!/usr/bin/env rake
require "bundler/gem_tasks"

desc "Open an irb session preloaded with this library"
task :console do
  sh "irb -rubygems -I lib -rponch"
end

require 'rake/testtask'

Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.libs << 'test'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = false
end

