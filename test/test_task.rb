require 'helper'
require 'task'


class TestTask < Test::Unit::TestCase
  
  def test_task
    
    t = Task.new
    t.text = 'text'
    t.priority = 1
    t.done = true

    
    assert_equal 'text', t.text
    assert_equal 1, t.priority
    assert_equal true, t.done

  end

  def test_projects
    t = Task.new
    t.add_project Project.new('project 1')
    assert_equal 1, t.projects.size
    assert_equal 'project 1', t.projects[0].name


    t.remove_project Project.new('project 1')
    assert_equal 0, t.projects.size

  end
  

  
end