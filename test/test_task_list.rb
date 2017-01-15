require File.expand_path '../helper', __FILE__

class TestTask < MiniTest::Test
  def setup
    # @list = Subtrack::TaskList.new
    @list = Object.new
    @list.extend Subtrack::TaskList
  end

  def test_split_name
    assert_equal ['first', 'second', 'third'],
      Subtrack::TaskList.split_name('first/second/third')

    assert_raises Subtrack::InvalidName do
      Subtrack::TaskList.split_name ''
    end

    assert_raises Subtrack::InvalidName do
      Subtrack::TaskList.split_name '//'
    end

    assert_raises Subtrack::InvalidName do
      Subtrack::TaskList.split_name 'a//b'
    end

    assert_raises Subtrack::InvalidName do
      Subtrack::TaskList.split_name 'a/__log/b'
    end
  end

  def test_descend
    refute @list.has_tasks?
    assert_nil @list['first']

    tasks = @list.descend('first/second/third').to_a
    assert @list.has_tasks?

    assert_equal 3, tasks.size
    assert_equal tasks[0], @list['first']
    assert_equal tasks[1], @list['first']['second']
    assert_equal tasks[2], @list['first']['second']['third']
    assert_nil @list['second']

    tasks.each {|task| assert_instance_of Subtrack::Task, task }
  end
end
