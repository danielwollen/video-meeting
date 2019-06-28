require 'test_helper'

class ShorturlTest < ActiveSupport::TestCase
  def setup
    @shorturl = Shorturl.create
  end

  test "should be valid" do
    assert @shorturl.valid?
  end

  test "should contain token" do
    assert @shorturl.token.present?
  end

  test "token should be 8 characters" do
    assert_equal @shorturl.token.length, 8
  end

  def teardown
    Shorturl.destroy_all
  end
end
