#ma class player; un joueur a un nom (habile) et un symbole ("x" ou "o")
class Player 

    #J'attribue mes variables d'instances
    attr_accessor :name, :symbol

    #J'initialise ma méthode name et symbol
    def initialize (name, symbol)
        @name = name
        @symbol = symbol
    end

end