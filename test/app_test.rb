require_relative './solutions/app'

class ClientTest < Test::Unit::TestCase

  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
    @app = App.new
  end

  attr_reader :app

  # Called after every test method runs. Can be used to tear
  # down fixture information.

  def test_checkout_115
    assert_equal 115, app.checkout("ABCB")
  end

  def test_checkout_145
    assert_equal 145, app.checkout("AAAD")
  end

  def test_checkout_illegal
    assert_equal -1, app.checkout("E")
  end

  def test_checkout_ABCDABCD
    assert_equal 215, app.checkout("ABCDABCD")
  end

  def test_checkout_BABDDCAC
    assert_equal 215, app.checkout("BABDDCAC")
  end

  def test_checkout_ABCDCBAABCABBAAA
    assert_equal 505, app.checkout("ABCDCBAABCABBAAA")
  end

end