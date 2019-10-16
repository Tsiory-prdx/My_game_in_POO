require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'
require_relative 'lib/humanPlayer'

#Acceuil

puts  "----------------------------------------"
puts  "|      Bienvenue à PARADOXIA !!!!!     |"
puts  "|   Ici survivre est la seule règle    |"
puts  "----------------------------------------"

#Entrer dans le monde

puts "entrer le nom de votre avatar ici"
print ">" 
name_user = gets.chomp

#Stockage des ennemies

enemies = []

user = HumanPlayer.new(name_user)

player1 = Player.new("José")
    enemies << player1

player2 = Player.new("Josiane")
    enemies << player2

    puts  "----------------------------------------"

    while (player1.life_points > 0 || player2.life_points > 0) && user.life_points > 0

            user.show_state
        
            puts  "----------------------------------------"

            puts "Quelle action veux-tu effectuer ?"
            puts " "
            puts "a - chercher une meilleure arme"
            puts "s - chercher à se soigner "
            puts " "
            puts "attaquer un joueur en vue :"
            puts "0- #{player1.show_state}"
            puts "1- #{player2.show_state}"
            print ">"
            choice = gets.chomp

            case choice 

            when "a"
                user.search_weapon
            when "s"
                user.search_health_pack
            when "0"
                user.attacks(player1)
            when "1"
                user.attacks(player2)
            end

            puts "Les autres joueurs lancent un assault"

            enemies.each do |enemie|
                if enemie.life_points > 0
                enemie.attacks(user)
                end
            end


    end
puts "La partie est finie"

if user.life_points > 0
    puts "BRAVO ! TU AS GAGNE !"
else
    puts "Loser ! Tu as perdu !"
end

