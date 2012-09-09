require 'pp'


class Task
  attr_accessor :text
  attr_accessor :priority
  
  def initialize(text = '', priority = 0)
    @text = text
    @priority = priority
  end
  
  
end  