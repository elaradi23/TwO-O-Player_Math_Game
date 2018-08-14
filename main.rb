require 'pry'
require './game'
require './question'
require './player'

player1 = Player.new('Player 1')
player2 = Player.new('Player 1')

game = Game.new(player1, player2)
game.start
