require File.expand_path '../helper', __FILE__

class TestSheet < MiniTest::Test
  def setup
    @datadir = Dir.mktmpdir
  end

  def teardown
    FileUtils.rm_r @datadir
  end

  # def test_start
  #   sheet = Subtrack::Sheet.new File.join(@datadir, '2017.yml')
  # end
end
