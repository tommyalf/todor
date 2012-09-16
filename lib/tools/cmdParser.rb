require 'optparse'
require 'ostruct'
require 'pp'

class CmdParser

  

	def parse(args)
	
	    @options = OpenStruct.new
	    @options.verbose = false
	    @options.command = nil
      @options.configurationFile = 'configuration.yml'
      @options.task = ''


	    opts = OptionParser.new do |opts|
	      opts.banner = "Usage: todor [options]"

	      opts.separator ""
	      opts.separator "Specific options:"


        opts.on("-ls", "--simple", "set command = list") do 
          @options.command = :list
        end

        opts.on("-a", "--mandatory task", "set command = add") do |task|
          @options.command = :add
          @options.task = task
        end
        
        opts.on("-u", "--simple", "set command = update") do 
          @options.command = :update
        end

        opts.on("-d", "--mandatory index", "set command = delete") do |index|
          @options.command = :delete
          @options.task = index
        end

        opts.on("-c", "--optional [configuration]", "set configuration = file") do  |file|
          @options.configurationFile = file
        end

	      # Boolean switch.
	      opts.on("-v", "--[no-]verbose", "Run verbosely") do |v|
		      @options.verbose = v
	      end

	      # No argument, shows at tail.  This will print an options summary.
	      # Try it and see!
	      opts.on_tail("-h", "--help", "Show this message") do
		      puts opts
		      exit
	      end
	    end

	    opts.parse!(args)
	    
	    if @options.command == nil 
	      findCommand(args)
	    end
	    
	    @options					
	end # def self.parse(args)

  def findCommand(args) 
    
    if args.include? 'list'
         @options.command = :list
    end

    if args.include? 'add'
         @options.command = :add  
    end

    if args.include? 'update'
         @options.command = :update  
    end

    if args.include? 'delete'
         @options.command = :delete  
    end


  end

end  # class CmdParser


