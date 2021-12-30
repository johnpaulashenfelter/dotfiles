#!/usr/bin/env ruby
require 'fileutils'

SOURCE = ARGV.first || './'
Dir.chdir(SOURCE)
puts "Using #{SOURCE}"

Dir.glob("**/*.{pdf,epub,mobi}") do |file|
  puts file
  dirname = File.basename(file, ".*")
  puts dirname
  Dir.mkdir(dirname) unless Dir.exist?(dirname)
  target = file.split('/').last
  puts target
  FileUtils.mv(file, "#{dirname}/#{target}")
end