require 'boardcase'
require 'game'

#Ma classe board pour l'institution du tableau
class Board

  attr_accessor :choice, :cases

  def initialize 
    
    a1 = Boardcase.new(1, " ")              # -- Création d'un plateau de jeu 3x3 --
    a2 = Boardcase.new(2, " ")
    a3 = Boardcase.new(3, " ")
    b1 = Boardcase.new(4, " ")
    b2 = Boardcase.new(5, " ")
    b3 = Boardcase.new(6, " ")
    c1 = Boardcase.new(7, " ")
    c2 = Boardcase.new(8, " ")
    c3 = Boardcase.new(9, " ")

    @cases = [a1, a2, a3, b1, b2, b3, c1, c2, c3]

  end

  # -- Structure du plateau avec les noms de cases --
  def show
    puts "\n     |     |     "
    puts "  #{@cases[0].case_symbole}  |  #{@cases[1].case_symbole}  |  #{@cases[2].case_symbole}  "
    puts "_____|_____|_____"
    puts "     |     |     "
    puts "  #{@cases[3].case_symbole}  |  #{@cases[4].case_symbole}  |  #{@cases[5].case_symbole}  "
    puts "_____|_____|_____"
    puts "     |     |     "
    puts "  #{@cases[6].case_symbole}  |  #{@cases[7].case_symbole}  |  #{@cases[8].case_symbole}  "
    puts "     |     |     "
  end

  
  def is_playable?(cases)
    if cases.case_symbole == " "
      return true
    else 
      return false
    end  
  end 
  
  def player_choice(choice, player_symbole, player_name)        # -- Le joueur choisi un symbole "O" ou "X", le deuxiéme joueur aura l'autre symbole par défault.
    self.case_symbole(choice, player_symbole, player_name)

  end

  def case_symbole(choice, player_symbole, player_name)         # -- Choix de la case, le joueur devra mettre un chiffre entre 0 et 8 --
    if is_playable?(@cases[choice - 1])
      if player_symbole == "O"
        @cases[choice - 1].case_symbole = player_symbole.blue
      else
        @cases[choice - 1].case_symbole = player_symbole.red
      end
    else
      puts "La case est deja prise !".red                       # Si le joueur choisi un case déjà occupé, il lui demandera de choisir une autre case --
      choice = gets.chomp.to_i
      self.case_symbole(choice, player_symbole, player_name)
    end
  end
  
  # -- Def construite pour les différents cas de victoire --
  def victoire
   
    if @cases[0].case_symbole == @cases[1].case_symbole && @cases[1].case_symbole == @cases[2].case_symbole && @cases[0].case_symbole != " "
      return true
    elsif @cases[3].case_symbole == @cases[4].case_symbole && @cases[4].case_symbole == @cases[5].case_symbole && @cases[4].case_symbole != " "
      return true
    elsif @cases[6].case_symbole == @cases[7].case_symbole && @cases[7].case_symbole == @cases[8].case_symbole && @cases[7].case_symbole != " "
      return true
    elsif @cases[0].case_symbole == @cases[3].case_symbole && @cases[3].case_symbole == @cases[6].case_symbole && @cases[3].case_symbole != " "
      return true
    elsif @cases[1].case_symbole == @cases[4].case_symbole && @cases[4].case_symbole == @cases[7].case_symbole && @cases[7].case_symbole != " "
      return true
    elsif @cases[2].case_symbole == @cases[5].case_symbole && @cases[5].case_symbole == @cases[8].case_symbole && @cases[8].case_symbole != " "
      return true
    elsif @cases[2].case_symbole == @cases[4].case_symbole && @cases[4].case_symbole == @cases[6].case_symbole && @cases[6].case_symbole != " "
      return true
    elsif @cases[0].case_symbole == @cases[4].case_symbole && @cases[4].case_symbole == @cases[8].case_symbole && @cases[8].case_symbole != " "
      return true
    end
  end
end