require 'helper'
require 'handleTask'

class MyEngine

  def save objects
    puts objects
  end

  def load
    Hash.new
  end

end


class TestManageClass < Test::Unit::TestCase

  def test_add_task

    @handle = HandleTask.new
    @handle.engine= MyEngine.new
    @handle.add 'test'

    assert_equal 1, @handle.tasks.size
    t = @handle.tasks[1]

    assert_equal 'test', t.text

    @handle
  end

  def test_delete_task
    h = test_add_task
    h.delete 1

    assert_equal 0, h.tasks.size

    h.add 't1'
    h.add 't2'

    assert_equal 2, h.tasks.size

    h.delete 2

    assert_equal 1, h.tasks.size
    assert_equal 't1', h.tasks[1].text

  end

  def test_modify_task
    h = test_add_task
    t = h.tasks[1]
    h.add 't2'

    m = t.clone
    m.text = 'test xxx'

    h.modify 2, m.text

    assert_equal 'test xxx', h.tasks[2].text

  end

  def test_save
    h = test_add_task
    h.add 't2'
    h.add 't3'
    h.add 't4'
    h.add 't5'

    puts h.save

  end

  def test_done
    h = test_add_task
    h.done 1

  end





end