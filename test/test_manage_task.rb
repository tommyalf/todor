require 'helper'
require 'handleTask'

class TestManageClass < Test::Unit::TestCase
  
  def test_add_task
    h = HandleTask.new
    
    h.add 'test'
    h.add 'test', 4
    
  end 
  
  
end