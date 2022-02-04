class Player

    @@player = 0
    @@symbole = ""
  
    attr_accessor :player_name, :player_symbole, :points
  
    # --    Initialisation des joueurs    --
    def initialize 
      @player_name = ""
      @player_symbole = ""
      @@player += 1
      @points = 0
    end
  
    # --    Mise en place, choix symbole    --
    def infos
      puts "\n➡️  Joueurs, saisissez vos nom ou vos a.k.a "
      print "\t> "                                                          #Met plusieurs "tab"                                                              
      @player_name = ((gets.chomp).to_s).capitalize
  
      if @@player == 1 && @@symbole == ""
        puts "\nAvec quel symbole veux-tu jouer ? ❌ ou ⭕ (choisis X ou O)" 
        while @player_symbole != "X" && @player_symbole != "O" do
           @player_symbole = (gets.chomp).to_s.capitalize
        end
      elsif @@symbole == "X"                                                 #Defini automatiquement le symbole du deuxieme joueur
        @player_symbole = "O" 
      elsif @@symbole == "O"
        @player_symbole = "X"
      end
      @@symbole = @player_symbole
      puts "#{@player_name} jouera avec le symbole : #{@player_symbole} !"    #Affiche les symboles choisi par le joueur
    end
    
  end