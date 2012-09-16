require "yaml"


class Configuration
    attr_accessor :engine, :configurationFile, :tasksFile

    def initialize engine, configurationFile, tasksFile = 'tasks'
      @tasksFile = tasksFile
      @engine = engine
      @configurationFile = configurationFile
    end


    def save
      File.open(@configurationFile, 'w') {|f| f.write(YAML.dump(self)) }
    end

    def self.load configurationFile
      c = YAML::load(File.read(configurationFile))
      c
    end


end