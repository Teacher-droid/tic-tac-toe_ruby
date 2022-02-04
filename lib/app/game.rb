require 'board'
require 'player'

#Ma class game pour les règles de mon jeu 
class Game 

  attr_accessor :status, :board

  def initialize
    
    # --    Creation des joueurs, stock dans un array, selection du premier joueur    --
    @player1 = Player.new
    @player1.infos
    @player2 = Player.new
    @player2.infos

    # --    Jeu en cours / Creation nouveau plateau    --
    @status = "on going"
    @board = Board.new
    
  end
   # --   Défini le tour des joueurs --
  def turn(player)
    display_title()
    @choice = 0
    puts "\t #{@player1.player_name} a choisi #{@player1.player_symbole}, #{@player2.player_name} a choisi #{@player2.player_symbole} ! A vous de jouez ! 🕹️"
    @board.show
    puts "#{player.player_name} à toi de jouer ! 🕹️"
    puts "Choisi une case entre 1 et 9 :"
    while !((1..9).include?(@choice))
      @choice = gets.chomp.to_i
    end
    @board.player_choice(@choice, player.player_symbole, player)
    if @board.victoire
      player.points += 1
    end
  end

  def on_going
    display_title()
    i = 0
   # -- Boucle loop, lance les tours des joueurs jusqu'à victoire de l'un ou de l'autre. --
    loop do
      if @board.victoire == true
      return true
      end
      break if i > 8
      self.turn(@player1)
      i += 1
      if @board.victoire == true
        display_title()
        @board.show
        puts "\n\n"
        puts "🎉 # #{@player1.player_name} as gagné 🏆 !!! 🎉".green
        
        break
      end
      break if i > 8 
      self.turn(@player2)
      i += 1
      if @board.victoire == true
        display_title()
          @board.show
          puts "\n\n" 
          puts "🎉 # #{@player2.player_name} as gagné. 🏆 !!! 🎉".green
          break
      end
    end
    if i > 8      # -- Si toutes les cases sont pleines sans victoire, annonce le match nul. --
      @board.show 
      puts "Match nul ,dommage !!! 😵💩😵💩😵".blue
    end             
    puts "Veux tu rejouer une partie ? Y ou N".cyan   # -- Prpose de relancer une partie ou de stoper le jeu. --
    choice = gets.chomp.capitalize
    if choice == "Y"
    @board = Board.new
    self.on_going
    end
  end

   # -- Affiche l'en-tête du jeu --
  def display_title 
    system('clear')
    puts"    __     ______    ______                             __           ".center(100).cyan
    puts"  _/  |   /      \\  /      \\                           /  |          ".center(100).cyan
    puts" / $$ |  /$$$$$$  |/$$$$$$  |  _______   ______    ____$$ |  ______  ".center(100).cyan
    puts" $$$$ |  $$$  \\$$ |$$$  \\$$ | /       | /      \\  /    $$ | /      \\ ".center(100).cyan
    puts"   $$ |  $$$$  $$ |$$$$  $$ |/$$$$$$$/ /$$$$$$  |/$$$$$$$ |/$$$$$$  |".center(100).cyan
    puts"   $$ |  $$ $$ $$ |$$ $$ $$ |$$ |      $$ |  $$ |$$ |  $$ |$$    $$ |".center(100).cyan
    puts"  _$$ |_ $$ \\$$$$ |$$ \\$$$$ |$$ \\_____ $$ \\__$$ |$$ \\__$$ |$$$$$$$$/ ".center(100).blue
    puts" / $$   |$$   $$$/ $$   $$$/ $$       |$$    $$/ $$    $$ |$$       |".center(100).blue
    puts" $$$$$$/  $$$$$$/   $$$$$$/   $$$$$$$/  $$$$$$/   $$$$$$$/  $$$$$$$/ ".center(100).blue
    puts "🕹️  MORPION🕹️   by 100Code".center(100).italic.red
    puts "Validé par Master David hachtag ad".center(100).italic.red
    puts ""
    puts ""
  end

end

class String
  def black;          "\e[30m#{self}\e[0m" end
  def red;            "\e[31m#{self}\e[0m" end
  def green;          "\e[32m#{self}\e[0m" end
  def brown;          "\e[33m#{self}\e[0m" end
  def blue;           "\e[34m#{self}\e[0m" end
  def magenta;        "\e[35m#{self}\e[0m" end
  def cyan;           "\e[36m#{self}\e[0m" end
  def gray;           "\e[37m#{self}\e[0m" end

  def bold;           "\e[1m#{self}\e[22m" end
  def italic;         "\e[3m#{self}\e[23m" end
  def underline;      "\e[4m#{self}\e[24m" end
  def blink;          "\e[5m#{self}\e[25m" end
  def reverse_color;  "\e[7m#{self}\e[27m" end

end