require "helper"
require "configuration"


class TestConfiguration < Test::Unit::TestCase

  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
    @configuration =  Configuration.new 'yamlEngine', 'configuration.yml'
  end

  # Called after every test method runs. Can be used to tear
  # down fixture information.

  def teardown
    # Do nothing
  end

  # Fake test
  def test_load_configuration


  end

  def test_save_configuration

    p "start save configuration"

    @configuration.save

    c = Configuration.load 'configuration.yml'

    puts "class:" + c.class.to_s

    assert_equal 'yamlEngine', c.engine
    assert_equal 'configuration.yml', c.configurationFile
  end

end