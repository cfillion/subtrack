require File.expand_path '../helper', __FILE__

class TestTask < MiniTest::Test
  def test_start_stop
    task = Subtrack::Task.new
    refute task.active?
    task.start
    assert task.active?
    task.stop
    refute task.active?
  end

  def test_start_stop_in_past
    task = Subtrack::Task.new
    task.start
    assert_raises Subtrack::InvalidTime do
      task.stop DateTime.now.prev_day
    end
    assert task.active?
  end
end
