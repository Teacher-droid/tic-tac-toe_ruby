require 'bundler'
Bundler.require
require 'pry' 

$:.unshift File.expand_path("./../lib", __FILE__)
require 'application'

require_relative 'lib/app/game'
require_relative 'lib/app/player'
require_relative 'lib/app/board'
require_relative 'lib/app/boardcase'
require_relative 'lib/app/application'
require_relative 'lib/app/show'


Application.new

Application.new.perform
system('clear')
game = Game.new
game.

