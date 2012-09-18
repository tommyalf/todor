require 'tools/cmdParser'
require 'application'


module Todor

  def self.do
    cmd_parser = CmdParser.new
    options = cmd_parser.parse(ARGV)
    Application.run options
  end

end
