# Handle Task - manage task requests
#
# it's able to add, delete, modify and retrieve tasks

require 'task'


class HandleTask

  attr_reader :tasks

  def initialize
    @tasks = Hash.new
  end

  def add(text, priority = 1)
    t = Task.new text, priority
    @tasks[@tasks.size+1] = t
  end

  def delete(index)
    @tasks.delete index
  end

  def modify(index, task)
    @tasks[index] = task
  end

  def save
    @tasks
  end

end 
