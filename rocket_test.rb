require "minitest/autorun"
require_relative "rocket"

class RocketTest < Minitest::Test
  def test_rocket_created_w_options
    rocket = Rocket.new(name: "Jeff Booster", colour: "Blue", flying: true)
    assert_equal("Jeff Booster", rocket.name)
    assert_equal("Blue", rocket.colour)
    assert_equal(true, rocket.flying?)
  end

  def test_rocket_created_w_o_options
    rocket = Rocket.new
    assert rocket.name
    assert rocket.colour
    refute rocket.flying?
  end

  def test_name_setter
    rocket = Rocket.new
    rocket.name = "Jeff Booster 2"
    assert_equal("Jeff Booster 2", rocket.name)
  end
end
