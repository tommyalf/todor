require 'helper'
require 'tools/cmdParser'

class TestCmdParser < Test::Unit::TestCase
  
  
  def test_verbose
    o = parse ['-v']
    assert_equal true, o.verbose    
  end
  
  def test_list
    o = parse ['-ls', 'x', 'x', 'x']
    assert_equal :list, o.command
    
    o = parse ['-v', 'list', 'x', 'x']
    assert_equal :list, o.command
    assert_equal true, o.verbose
  end

  def test_add
    o = parse ['-a', 'x', 'x', 'x']
    assert_equal :add, o.command
    
    o = parse ['-v', 'add', 'x', 'x']
    assert_equal :add, o.command
    assert_equal true, o.verbose
  end

  def test_del
    o = parse ['-d-2', 'x', 'x', 'x']
    assert_equal :delete, o.command
    
    o = parse ['-v', 'delete', 'x', 'x']
    assert_equal :delete, o.command
    assert_equal true, o.verbose
  end

  def test_update
    o = parse ['-u', 'x', 'x', 'x']
    assert_equal :update, o.command
    
    o = parse ['-v', 'update', 'x', 'x']
    assert_equal :update, o.command
    assert_equal true, o.verbose
  end

  def test_done
    o = parse ['-o', 'x', 'x', 'x']
    assert_equal :done, o.command

  end


  def test_configuration
    o = parse ['-c', 'myConfiguration.yml']
    assert_equal 'myConfiguration.yml', o.configurationFile

  end

  def test_add_project
    o = parse ['-yproject, 4,yyy', 'x']
    assert_equal ['-yproject', ' 4','yyy'], o.projects
    assert_equal true, o.has_projects

  end



  private
  
  def parse(args)
    c = CmdParser.new
    c.parse args    
  end

  
end
