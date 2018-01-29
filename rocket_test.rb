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
    assert rocket.name, "Rocket should have a name"
    assert rocket.colour, "Rocket should have a colour"
    refute rocket.flying?, "rocket.flying? should be false"
  end

  def test_name_setter
    rocket = Rocket.new
    rocket.name = "Jeff Booster 2"
    assert_equal("Jeff Booster 2", rocket.name)
  end

  def test_colour_setter
    rocket = Rocket.new
    rocket.colour = "chartreuse"
    assert_equal("chartreuse", rocket.colour)
  end

  def test_liftoff_changes_flying_to_true_when_flying_is_false
    rocket = Rocket.new
    rocket.lift_off
    assert rocket.flying?, "@flying should be true after lift_off"
  end

  def test_liftoff_returns_true_when_flying_is_false
    rocket = Rocket.new
    assert_equal(true, rocket.lift_off)
  end

  def test_liftoff_returns_false_when_flying_is_true
    rocket = Rocket.new
    rocket.lift_off
    assert_equal(false, rocket.lift_off)
  end

  def test_land_sets_flying_to_false_if_already_flying
    rocket = Rocket.new
    rocket.lift_off
    rocket.land
    refute rocket.flying?, "flying should be false after land"
  end

  def test_land_returns_true_if_already_flying
    rocket = Rocket.new
    rocket.lift_off
    assert_equal(true, rocket.land)
  end

  def test_land_returns_false_if_not_already_flying
    rocket = Rocket.new
    refute rocket.land, "land should return false if not flying"
  end

  def test_status_for_flying_rocket
    rocket = Rocket.new
    rocket.lift_off
    rocket.name = "Jeff Booster III"
    expected = "Rocket Jeff Booster III is flying through the sky!"
    assert_equal(expected, rocket.status)
  end

  def test_status_for_non_flying_rocket
    rocket = Rocket.new
    rocket.name = "Jeff Booster III"
    expected = "Rocket Jeff Booster III is ready for lift off!"
    assert_equal(expected, rocket.status)
  end
end
