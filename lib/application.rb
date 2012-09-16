require "configuration"


class Application

    def self.run options
      @options = options
      @configuration = Configuration.load options.configurationFile

      @handle_task = HandleTask.new
      @handle_task.configuration = @configuration

      require "engines/yamlEngine" #@configuration.engine

      engine = @configuration.engine[0].capitalize + @configuration.engine[1..-1]

      @handle_task.engine= eval engine + ".new"
      @handle_task.load @configuration.tasksFile

      puts "options:" + @options.to_s

      executeList if @options.command == :list
      executeAddTask if @options.command == :add
      executeDeleteTask if @options.command == :delete

      @handle_task.save
    end

    def self.executeDeleteTask
      @handle_task.delete @options.task
    end

    def self.executeAddTask
      task = @options.task
      puts 'add task ' + task
      @handle_task.add task

    end

    def self.executeList
      puts @handle_task.showTasks
    end

end