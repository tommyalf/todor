require 'tools/cmdParser'


module Todor
  def self.do
	options = CmdParser.parse(ARGV)
  Application.run options
  end
end
