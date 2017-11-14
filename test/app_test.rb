# noinspection RubyResolve,RubyResolve
require_relative 'test_helper'
require 'logging'

Logging.logger.root.appenders = Logging.appenders.stdout

class ClientTest < Minitest::Test

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
    assert_equal -1, app.checkout("X")
  end

  def test_checkout_ABCDABCD
    assert_equal 215, app.checkout("ABCDABCD")
  end

  def test_checkout_BABDDCAC
    assert_equal 215, app.checkout("BABDDCAC")
  end

  def test_checkout_ABCDCBAABCABBAAA
    assert_equal 495, app.checkout("ABCDCBAABCABBAAA")
  end

  def test_checkout_EEB
    assert_equal 80, app.checkout("EEB")
  end

  def test_checkout_a
    assert_equal -1, app.checkout("a")
  end

  def test_checkout_EE
    assert_equal 80, app.checkout("EE")
  end

  def test_checkout_EEEEBB
    assert_equal 160, app.checkout("EEEEBB")
  end

  def test_checkout_BEBEEE
    assert_equal 160, app.checkout("BEBEEE")
  end

  def test_checkout_ABCDEABCDE
    assert_equal 280, app.checkout("ABCDEABCDE")
  end

  def test_checkout_FF
    assert_equal 20, app.checkout("FF")
  end

  def test_checkout_FFF
    assert_equal 20, app.checkout("FFF")
  end

  def test_checkout_FFFF
    assert_equal 30, app.checkout("FFFF")
  end

  def test_checkout_FFFFF
    assert_equal 40, app.checkout("FFFFF")
  end
end