require 'pp'
require 'project'


class Task
  attr_accessor :text
  attr_accessor :priority, :done, :projects

  def initialize(text = '', priority = 0, done = false)
    @done = done
    @text = text
    @priority = priority
    @projects = []
  end

  def add_project project
    @projects << project
  end

  def remove_project project
    @projects.delete project
  end


end