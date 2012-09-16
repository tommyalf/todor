require "test/unit"
require "application"
require "tools/cmdParser"

class TestApplication < Test::Unit::TestCase

  def setup
    puts '***************** Start " + self.__name__ + "***************** '
  end


  def teardown
    puts '***************** End " + self.__name__ + "*****************'
  end

  #def test_application_run_list
  #  argv = ['-ls']
  #  c = CmdParser.new
  #  options = c.parse(argv)
  #  #p options
  #  a = Application.run options
  #
  #
  #
  #end

  def test_application_run_add

    argv = ['-a prova']
    c = CmdParser.new
    options = c.parse(argv)
    #p options
    Application.run options
    options.command = :list
    Application.run options


  end


end