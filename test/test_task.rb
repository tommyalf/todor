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
  
  
  
end