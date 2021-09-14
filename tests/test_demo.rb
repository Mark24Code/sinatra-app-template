require 'minitest/autorun'

class TestMyLife < MiniTest::Test
  def setup
    @me = "hello world"
  end

  def test_sleep
     # assert_equal exp, act, msg
     assert_equal   "hello world", @me
  end

  def teardown
  end
end