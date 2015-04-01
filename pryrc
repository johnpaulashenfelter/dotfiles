# Load plugins (only those I whitelist)
Pry.config.should_load_plugins = false
#Pry.plugins["doc"].activate!

#Pry.commands.alias_command 'c', 'continue'
#Pry.commands.alias_command 's', 'step'
#Pry.commands.alias_command 'n', 'next'
#
Pry::Commands.block_command 'fuu', "Use fuubar formatter in rspec" do
    options = ::Guard.guards(:rspec).runner.options
      options[:cli] = options[:cli].sub(/\-\-format \w+/, '--format Fuubar')
        output.puts "Using Fuubar as RSpec formatter."
end

Pry::Commands.block_command 'doc', "Use documentation formatter in rspec" do
    options = ::Guard.guards(:rspec).runner.options
      options[:cli] = options[:cli].sub(/\-\-format \w+/, '--format documentation')
        output.puts "Using Documentation as RSpec formatter."
end