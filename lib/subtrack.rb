require 'commander'

class Subtrack
  %w{cli gem}.each {|file|
    require "subtrack/#{file}"
  }

  def initialize(datadir)
  end

  def switch(name)
    puts "switch #{name.inspect}"
  end

  def start(name)
    puts "start #{name.inspect}"
  end

  def stop(name, force)
    puts "stop #{name.inspect} #{force.inspect}"
  end
end
