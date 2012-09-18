require 'yaml'

class YamlEngine

    attr_writer :file

    def load file
      @file = file
      o = YAML::load(File.read(@file))
      #puts "uuuu"+ o.class.to_s
      o

    rescue Exception => e
      puts e
      nil
    end

    def save object
      #puts "objects:" + object.to_yaml
      File.open(@file, 'w') {|f| f.write(YAML.dump(object)) }
    end


end