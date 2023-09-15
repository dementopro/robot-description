require 'minitest/autorun'
require_relative 'robot'
require_relative 'robot_simulator'

class TestRobot < Minitest::Test
  def setup
    @robot = Robot.new
  end

  def test_place_valid_position_and_direction
    @robot.place(2, 3, :north)
    assert_equal 2, @robot.x
    assert_equal 3, @robot.y
    assert_equal :north, @robot.facing
  end

  def test_place_invalid_position
    @robot.place(5, 5, :north)
    assert_nil @robot.x
    assert_nil @robot.y
    assert_nil @robot.facing
  end

  def test_move_within_grid
    @robot.place(1, 1, :north)
    @robot.move
    assert_equal 2, @robot.y
  end

  def test_move_outside_grid
    @robot.place(4, 4, :east)
    @robot.move
    assert_equal 4, @robot.x
  end

  def test_move_robot_without_placing
    @robot.move
    assert_nil @robot.facing 
  end

  def test_move_robot_to_left_side
    @robot.place(2, 2, :east)
    @robot.left
    assert_equal @robot.facing, :north 
  end

  def test_move_robot_to_right_side
    @robot.place(3, 4, :north)
    @robot.right
    assert_equal @robot.facing, :east 
  end

  def test_robot_report
    @robot.place(1, 3, :east)
    @robot.move
    assert_equal @robot.report, "Output: 2,3,east"
    assert_equal @robot.facing, :east 
  end
end
