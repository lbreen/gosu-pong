class Player
  attr_reader :x, :y, :image

  def initialize(window, side)
    @image = Gosu::Image.new("media/paddle.png")
    @window = window
    @side = side
    @score = 0

    @font = Gosu::Font.new(20)

    #  This determines the start positions for the paddles
    if side == 'left'
      @x = 50
    else
      @x = window.width - @image.width - 50
    end
    @y = (window.height - @image.height) / 2
  end

  def wins
    #  This method is called if the ball travels behind a players paddle.
    @score += 1
  end

  def update
    #  This method determines what the paddle's should do if thier respective
    #  up/down buttons are pressed. If their up button is pressed, they will
    #  move up (@y += 5) until they reach the top of the screen (@y == 0).
    #  Similarly, they will move down (@y += 5) until they reach the bottom.
    if Gosu::button_down?(up_button)
      @y -= 5 unless @y == 0
    elsif Gosu::button_down?(down_button)
      @y += 5 unless @y == (@window.height - @image.height)
    end
  end

  def draw
    #  This refreshes the pixels on the screen for the two paddles and the
    #  score counters.
    @image.draw(@x, @y, 1)
    x = @side == 'left' ? @x : @x - 40
    @font.draw("Score: #{@score}", x, 10, 2, 1.0, 1.0, 0xff_ffff00)
  end

  private

  def up_button
    #  This determines that the button to move Player 1 up is "W", while for
    #  Player 2 it is the up-arrow button.
    @side == 'left' ? Gosu::KbW : Gosu::KbUp
  end

  def down_button
    #  This determines that the button to move Player 1 down is "S", while for
    #  Player 2 it is the down-arrow button.
    @side == 'left' ? Gosu::KbS : Gosu::KbDown
  end
end
