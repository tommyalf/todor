require "configuration"
require 'handleTask'
require "pathname"

class Application

  def self.run options
    @options = options
    @configuration = Configuration.load options.configurationFile

    @handle_task = HandleTask.new
    @handle_task.configuration = @configuration

    engine = @configuration.engine

    require engine

    engine_class = Pathname.new(engine).basename.to_s

    engine_class = engine_class[0].capitalize + engine_class[1..-1]

    @handle_task.engine= eval engine_class + ".new"
    @handle_task.load @configuration.tasksFile

    #puts "options:" + @options.to_s

    executeAddTask if @options.command == :add
    executeDeleteTask if @options.command == :delete
    executeModifyTask if @options.command == :update
    executeChangePriorityTask if @options.command == :change_priority
    executeDoneTask if @options.command == :done


    @handle_task.save

    executeList
  end

  def self.executeDoneTask
    @handle_task.done @options.index
  end

  def self.executeChangePriorityTask
    @handle_task.change_priority @options.index, @options.priority
  end

  def self.executeModifyTask
    task = @options.task
    puts 'modify task ' + task.to_s + ' ' + @options.index.to_s
    @handle_task.modify @options.index, task, @options.priority
  end

  def self.executeDeleteTask
    index = @options.index
    puts 'Delete index:' + index.to_s
    @handle_task.delete index
  end

  def self.executeAddTask
    task = @options.task
    #puts 'add task ' + task
    @handle_task.add task, @options.priority
  end

  def self.executeList
    @handle_task.showTasks
  end

end