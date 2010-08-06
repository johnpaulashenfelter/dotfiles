#!/usr/bin/ruby

# enable utility_belt http://utilitybelt.rubyforge.org/usage.html
require 'rubygems'
require 'utility_belt'
UtilityBelt.equip(:all)
# require 'bond'
#Bond.start
# require 'hirb'
#Hirb.enable

# from http://toolmantim.com/article/2007/2/6/system_wide_script_console_logging
# script_console_running = ENV.include?('RAILS_ENV') && IRB.conf[:LOAD_MODULES] && IRB.conf[:LOAD_MODULES].include?('console_with_helpers')
# rails_running = ENV.include?('RAILS_ENV') && !(IRB.conf[:LOAD_MODULES] && IRB.conf[:LOAD_MODULES].include?('console_with_helpers'))
# irb_standalone_running = !script_console_running && !rails_running
# 
# if script_console_running
#   require 'logger'
#   Object.const_set(:RAILS_DEFAULT_LOGGER, Logger.new(STDOUT))
# end

# Include tab-completion in irb
#require 'irb/completion'
#require 'irb/ext/save-history'
#IRB.conf[:SAVE_HISTORY] = 100
#IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history"
#IRB.conf[:PROMPT_MODE] = :SIMPLE
#IRB.conf[:AUTO_INDENT] = true

class Object
 # list methods which aren't in superclass
 def local_methods(obj = self)
   (obj.methods - obj.class.superclass.instance_methods).sort
 end
end

def copy(str)
  IO.popen('pbcopy', 'w') { |f| f << str.to_s }
end

def paste
  `pbpaste`
end

def ep
  eval(paste)
end

load File.dirname(__FILE__) + '/.railsrc' if $0 == 'irb' && ENV['RAILS_ENV']
