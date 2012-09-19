


class Project

  attr_accessor :name

  def initialize name
    @name = name
  end

  def ==(other)
    other.class == self.class &&
        other.name  == @name
  end
  alias :eql? :==

end