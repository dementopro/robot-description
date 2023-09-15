
require_relative 'robot'

class RobotSimulator
  def initialize
    @robot = Robot.new
  end

  def run
    loop do
      print "Enter command: "
      command = gets.chomp.downcase
      execute_command(command)
      break if command == 'exit'
    end
  end

  private

  def execute_command(command)
    case command
    when /^place (\d+),(\d+),(north|east|south|west)$/
      @robot.place($1.to_i, $2.to_i, $3.to_sym)
    when 'move'
      @robot.move
    when 'left'
      @robot.left
    when 'right'
      @robot.right
    when 'report'
      @robot.report
    when 'exit'
      puts 'Exiting the robot simulator...'
    else
      puts 'Invalid command.'
    end
  end
end

