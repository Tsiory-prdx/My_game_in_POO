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

my_game = Game.new(name_user)

while my_game.is_still_ongoing? == true

    my_game.new_players_in_sight

    my_game.show_players
    
    my_game.show_enemies

    my_game.menu_choice

    my_game.enemies_attack

end

my_game.end