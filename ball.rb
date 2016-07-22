class Ball
  def initialize(window, player1, player2)
    @window = window
    @player1 = player1
    @player2 = player2
    @image = Gosu::Image.new("media/ball.png")

    reset
  end

  def update
    @x += Gosu::offset_x(@angle, 8)
    @y += Gosu::offset_y(@angle, 8)

    #  This determines which player wins when the ball goes past the opponents
    #  paddle
    if @x <= 0
      @player2.wins
      reset
    elsif (@x - @image.width) >= @window.width
      @player1.wins
      reset
    end

    #  This sets the boundaries of the playing field by preventing the ball
    #  from travelling off the top or bottom of the screen
    if @y >= (@window.height - @image.height)
      @angle -= 90
    end
    if @y <= 0
      @angle += 90
    end

    #  This will change the direction of the ball by a set angle if player 2's
    #  paddle hits the ball i.e. if the ball goes above the paddle OR if the
    #  ball goes underneath the paddle, there will be no effect on the ball.
    if (@player2.y > (@y + @image.height)) ||
        ((@player2.y + @player2.image.height) < @y)
      # Do not touch x
    else
      if (@x + @image.width) >= @player2.x
        @angle -= 90
      end
    end


    #  This will change the direction of the ball by a set angle if player 1's
    #  paddle hits the ball i.e. if the ball goes above the paddle OR if the
    #  ball goes underneath the paddle, there will be no effect on the ball.
    if (@player1.y > (@y + @image.height)) ||
        ((@player1.y + @player1.image.height) < @y)
    else
      if @x <= @player1.x + @image.width
        @angle += 90
      end
    end
  end

  def draw
    #  This method refreshes the pixels on the screen
    @image.draw(@x, @y, 1)
  end

  def reset
    #  This method resets the position of the ball when a player scores
    @x = (@window.width - @image.width) / 2
    @y = (@window.height - @image.height) / 2
    @angle = 40
  end
end
