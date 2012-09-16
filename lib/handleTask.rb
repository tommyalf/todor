# Handle Task - manage task requests
#
# it's able to add, delete, modify and retrieve tasks

require 'task'
require "configuration"

class HandleTask

  attr_reader :tasks
  attr_writer :configuration, :engine
  

  def initialize
    @tasks = Hash.new
    @configuration = nil
    @engine = nil
  end

  def load file
    puts "Engine:" + @engine.class.to_s
    @tasks = @engine.load file
    puts 'pre tasks :' + @tasks.to_s

    @tasks = Hash.new if @tasks == nil
    puts 'tasks :' + @tasks.to_s
  end

  def save
    puts "save tasks: " + tasks.to_s
    @engine.save @tasks
  end


  def add(text, priority = 1)
    t = Task.new text, priority
    @tasks[@tasks.size+1] = t
    @tasks
  end

  def delete(index)
    @tasks.delete index
  end

  def modify(index, task)
    @tasks[index] = task
  end


  def showTasks
    @tasks
  end

end 
