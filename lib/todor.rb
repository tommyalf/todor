require 'tools/cmdParser'


module Todor
  def self.do
	options = {}
#	OptionParser.new do |opts|
#	  opts.banner = "Usage: example.rb [options]"

#	  opts.on("-v", "--[no-]verbose", "Run verbosely") do |v|
#	    options[:verbose] = v
#	  end
#	end.parse!
	p "Todor"
#	p "Options:" + options.to_s
	p "Arguments" + ARGV.to_s

	p CmdParser.parse(ARGV)

  end
end
