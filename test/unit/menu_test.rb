require 'test_helper'

class MenuTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Menu.new.valid?
  end
end
