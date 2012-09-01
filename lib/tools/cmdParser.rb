require 'optparse'
require 'ostruct'
require 'pp'

class CmdParser

	def parse(args)
	
	    options = OpenStruct.new
	    options.library = []
	    options.inplace = false
	    options.encoding = "utf8"
	    options.transfer_type = :auto
	    options.verbose = false
	    options.pippo='pippo'

	    opts = OptionParser.new do |opts|
	      opts.banner = "Usage: todor [options]"

	      opts.separator ""
	      opts.separator "Specific options:"
=begin

	      # Mandatory argument.
	      opts.on("-r", "--require LIBRARY",
		      "Require the LIBRARY before executing your script") do |lib|
		options.library << lib
	      end

	      # Optional argument; multi-line description.
	      opts.on("-i", "--inplace [EXTENSION]",
		      "Edit ARGV files in place",
		      "  (make backup if EXTENSION supplied)") do |ext|
		options.inplace = true
		options.extension = ext || ''
		options.extension.sub!(/\A\.?(?=.)/, ".")  # Ensure extension begins with dot.
	      end

	      # Cast 'delay' argument to a Float.
	      opts.on("--delay N", Float, "Delay N seconds before executing") do |n|
		options.delay = n
	      end
	      # Cast 'time' argument to a Time object.
	      opts.on("-t", "--time [TIME]", Time, "Begin execution at given time") do |time|
		options.time = time
	      end

	      # Cast to octal integer.
	      opts.on("-F", "--irs [OCTAL]", OptionParser::OctalInteger,
		      "Specify record separator (default \\0)") do |rs|
		options.record_separator = rs
	      end

	      # List of arguments.
	      opts.on("--list x,y,z", Array, "Example 'list' of arguments") do |list|
		options.list = list
	      end

	      # Keyword completion.  We are specifying a specific set of arguments (CODES
	      # and CODE_ALIASES - notice the latter is a Hash), and the user may provide
	      # the shortest unambiguous text.
	      code_list = (CODE_ALIASES.keys + CODES).join(',')
	      opts.on("--code CODE", CODES, CODE_ALIASES, "Select encoding",
		      "  (#{code_list})") do |encoding|
		options.encoding = encoding
	      end

	      # Optional argument with keyword completion.
	      opts.on("--type [TYPE]", [:text, :binary, :auto],
		      "Select transfer type (text, binary, auto)") do |t|
		options.transfer_type = t
	      end



	      opts.separator ""
	      opts.separator "Common options:"


	      # Another typical switch to print the version.
	      opts.on_tail("--version", "Show version") do
		puts OptionParser::Version.join('.')
		exit
	      end
=end


	      # Boolean switch.
	      opts.on("-v", "--[no-]verbose", "Run verbosely") do |v|
		      options.verbose = v
	      end

	      # No argument, shows at tail.  This will print an options summary.
	      # Try it and see!
	      opts.on_tail("-h", "--help", "Show this message") do
		      puts opts
		      exit
	      end
	    end

	    opts.parse!(args)
	    options					
	end # def self.parse(args)

end  # class CmdParser


