class Application 

    def 

puts "-------------------------------"

puts "     Let's get started         "
puts "-------------------------------"



end

def create_player_1
    puts "Player one's name :"
    player1 = gets.chomp
    while player1.empty?
        puts "enter a name :"
        player1 = gets.chomp
    end
    player1 = Player.new(player1 , "X")
    puts " #{player1.name} selected X' "
end

def create_player_2
    puts "Player two's name :"
    player2 = gets.chomp
    while player2.empty?
        puts "enter a name :"
        player2 = gets.chomp
    end
    player2 = Player.new(player2 , "O")
    puts " #{player1.name} selected O' "
end

perform