# Inspired by https://gist.github.com/justin808/1fe1dfbecc00a18e7f2a

## Benchmarking
# Inspired by <http://stackoverflow.com/questions/123494/whats-your-favourite-irb-trick/123834#123834>.

def time(repetitions = 100, &block)
  require 'benchmark'
  Benchmark.bm{|b| b.report{repetitions.times(&block)}}
end


Pry.config.color = true
Pry.config.prompt = Pry::NAV_PROMPT

Pry.config.commands.alias_command "h", "hist -T 20", desc: "Last 20 commands"
Pry.config.commands.alias_command "hg", "hist -T 20 -G", desc: "Up to 20 commands matching expression"
Pry.config.commands.alias_command "hG", "hist -G", desc: "Commands matching expression ever used"
Pry.config.commands.alias_command "hr", "hist -r", desc: "hist -r <command number> to run a command"

if defined?(PryByebug)
  Pry.commands.alias_command 'ss', 'step'
  Pry.commands.alias_command 'nn', 'next'
  Pry.commands.alias_command 'cc', 'continue'
  Pry.commands.alias_command 'fin', 'finish'
  Pry.commands.alias_command 'uu', 'up'
  Pry.commands.alias_command 'dd', 'down'
  Pry.commands.alias_command 'ff', 'frame'
  Pry.commands.alias_command 'bb', 'break'
  Pry.commands.alias_command 'ww', 'whereami'
end



begin
  require 'awesome_print'
  # Pry.config.print = proc { |output, value| output.puts value.ai }
  AwesomePrint.pry!
rescue LoadError => err
  puts "no awesome_print :("
end

puts "Loaded ~/.pryrc"
puts
def more_help
  puts "Helpful shortcuts:"
  puts "hh  : hist -T 20       Last 20 commands"
  puts "hg : hist -T 20 -G    Up to 20 commands matching expression"
  puts "hG : hist -G          Commands matching expression ever used"
  puts "hr : hist -r          hist -r <command number> to run a command"
  puts
  
  puts "Samples variables"
  puts
  puts "helper   : Access Rails helpers"
  puts "app      : Access url_helpers"
  puts
  puts "require \"rails_helper\"              : To include Factory Girl Syntax"
  puts "include FactoryGirl::Syntax::Methods  : To include Factory Girl Syntax"
  puts
  puts "or if you defined one..."
  puts "require \"pry_helper\""
  puts
  puts "Sidekiq::Queue.new.clear              : To clear sidekiq"
  puts "Sidekiq.redis { |r| puts r.flushall } : Another clear of sidekiq"
  puts
  puts "Debugging Shortcuts"
  puts 'ss  :  step'
  puts 'nn  :  next'
  puts 'cc  :  continue'
  puts 'fin :  finish'
  puts 'uu  :  up'
  puts 'dd  :  down'
  puts 'ff  :  frame'
  puts 'bb  :  break'
  puts 'ww  :  whereami' 
  ""
 end

