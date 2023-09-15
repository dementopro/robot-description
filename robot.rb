class Robot
  DIRECTIONS = [:north, :east, :south, :west].freeze
  attr_accessor :x, :y, :facing
  def initialize
    @x = nil
    @y = nil
    @facing = nil
  end

  def place(x, y, facing)
    if valid_position?(x, y) && valid_direction?(facing)
      @x = x
      @y = y
      @facing = facing
    end
  end

  def move
    return unless placed?

    case @facing
    when :north
      @y += 1 if valid_position?(@x, @y + 1)
    when :east
      @x += 1 if valid_position?(@x + 1, @y)
    when :south
      @y -= 1 if valid_position?(@x, @y - 1)
    when :west
      @x -= 1 if valid_position?(@x - 1, @y)
    end
  end

  def left
    return unless placed?

    current_index = DIRECTIONS.index(@facing)
    @facing = DIRECTIONS[(current_index - 1) % 4]
  end

  def right
    return unless placed?

    current_index = DIRECTIONS.index(@facing)
    @facing = DIRECTIONS[(current_index + 1) % 4]
  end

  def report
    return unless placed?

    p "Output: #{@x},#{@y},#{@facing}"
  end

  private

  def valid_position?(x, y)
    x.between?(0, 4) && y.between?(0, 4)
  end

  def valid_direction?(facing)
    DIRECTIONS.include?(facing)
  end

  def placed?
    !(@x.nil? || @y.nil? || @facing.nil?)
  end
end