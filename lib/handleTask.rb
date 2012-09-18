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
    @tasks = @engine.load file
    @tasks = Hash.new if @tasks == nil
  end

  def save
    @engine.save @tasks
  end

  def add(text, priority = 1)
    t = Task.new text, priority
    index = calculate_index
    @tasks[index] = t
    change_priority index, priority
  end

  def calculate_index
    value = 1
    if @tasks.keys.size > 0
      value = @tasks.keys.max + 1
    end
    value
  end

  def delete(index)
    @tasks.delete index
  end

  def modify(index, task, priority = 1)
    @tasks[index].text = task
    change_priority index, priority
  end

  def change_priority(index, priority)
    @tasks[index].priority = priority if priority > -1
  end

  def done (index)
    @tasks[index].done = true
  end

  def showTasks
    t = @tasks.sort { |x, y| y[1].priority <=> x[1].priority }

    t.each { |key, task| puts "#{key}: (#{task.priority} #{'done' if task.done})  #{task.text}" }
  end

end 
