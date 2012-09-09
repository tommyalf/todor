require 'helper'
require 'task'


class TestTask < Test::Unit::TestCase
  
  def test_task
    
    t = Task.new
    t.text = 'text'
    t.priority = 1
    
    assert_equal 'text', t.text
    assert_equal 1, t.priority
        
  end
  
  
  
end