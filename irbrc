#!/usr/bin/ruby

require 'rubygems'
require 'hirb'
Hirb.enable

#require 'irbtools'

# Include tab-completion in irb
#require 'irb/completion'
#require 'irb/ext/save-history'
#IRB.conf[:SAVE_HISTORY] = 100
#IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history"
#IRB.conf[:PROMPT_MODE] = :SIMPLE
#IRB.conf[:AUTO_INDENT] = true

# def ruby19?
#   RUBY_VERSION =~ /1\.9/
# end
# 
# if ruby19?
#   gem 'flyrb'
#   require 'flyrb'
# else
#   gem 'utility_belt'
#   require 'utility_belt'
#   UtilityBelt.equip(:all)
#   # looksee
# end

#require 'bond'
#Bond.start

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

railsrc_path = File.expand_path('~/.railsrc')
if ( ENV['RAILS_ENV'] || defined? Rails ) && File.exist?( railsrc_path )
  begin
    load railsrc_path
  # rescue Exception
  #   warn "Could not load: #{ railsrc_path }" # because of $!.message
  end
end
#load File.dirname(__FILE__) + '/.railsrc' if $0 == 'irb' && ENV['RAILS_ENV']

begin # Utility methods
  def pm(obj, *options) # Print methods
    methods = obj.methods
    methods -= Object.methods unless options.include? :more
    filter = options.select {|opt| opt.kind_of? Regexp}.first
    methods = methods.select {|name| name =~ filter} if filter

    data = methods.sort.collect do |name|
      method = obj.method(name)
      if method.arity == 0
        args = "()"
      elsif method.arity > 0
        n = method.arity
        args = "(#{(1..n).collect {|i| "arg#{i}"}.join(", ")})"
      elsif method.arity < 0
        n = -method.arity
        args = "(#{(1..n).collect {|i| "arg#{i}"}.join(", ")}, ...)"
      end
      klass = $1 if method.inspect =~ /Method: (.*?)#/
      [name, args, klass]
    end
    max_name = data.collect {|item| item[0].size}.max
    max_args = data.collect {|item| item[1].size}.max
    data.each do |item| 
      print "#{ANSI_LGRAY}#{item[0].rjust(max_name)}#{ANSI_RESET}"
      print "#{ANSI_BLUE}#{item[1].ljust(max_args)}#{ANSI_RESET}"
      print "#{ANSI_RED}#{item[2]}#{ANSI_RESET}\n"
    end
    data.size
  end
end
