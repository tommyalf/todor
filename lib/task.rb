require 'pp'


class Task
  attr_accessor :text
  attr_accessor :priority, :done

  def initialize(text = '', priority = 0, done = false)
    @done = done
    @text = text
    @priority = priority
  end

end  