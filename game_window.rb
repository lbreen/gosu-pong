require 'gosu'
require_relative 'player'
require_relative 'ball'

class GameWindow < Gosu::Window
  def initialize
    #  This sets the size of the game window to 640 by 480 pixels.
    super(640, 480)  # calling the parent method of the same name
    self.caption = "Pong Game"

    #  This creates two players and a ball in the Game window
    @player1 = Player.new(self, 'left')
    @player2 = Player.new(self, 'right')
    @ball    = Ball.new(self, @player1, @player2)
  end

  # Update state of the game
  def update
    @player1.update
    @player2.update
    @ball.update
  end

  # Refresh the pixels on the screen
  def draw
    @player1.draw
    @player2.draw
    @ball.draw
  end
end

window = GameWindow.new
window.show

