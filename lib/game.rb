class Game
#Creation des attributs de la classe
    attr_accessor :human_player, :players_left, :enemies_in_sight
    
    #fonction de demarrage 
    def initialize(name_of_user)
        @human_player = HumanPlayer.new(name_of_user)
        @players_left = 20
        @enemies_in_sight = []
    end

    #fonction pour eliminer un ennemi d'un tableau
    def kill_player(enemie_to_kill)
        enemies_safe = []
        @enemies_in_sight.each do |enemie|
            if enemie != enemie_to_kill
                enemies_safe << enemie
            end
        end

        @enemies_in_sight = enemies_safe
        #la fonction joueur restant diminue à chaque kill
        @players_left = @players_left - 1
    end

    #fonction "on continue ?" c'est la methode qui defini si le jeu continue ou pas
    def is_still_ongoing?

        if @human_player.life_points > 0 && @players_left > 0
            return true
        end
        return false
    end

    #amelioration de show_state pour afficher l'etat de tout les joueurs
    def show_players
        
        puts "#{@human_player.show_state}"
        puts " "

        for i in 0...@enemies_in_sight.size
            puts "#{@enemies_in_sight[i].show_state}"
        end
    end

    #fonctio du menu de choix
    def menu_choice
        
        puts "Quelle action veux-tu effectuer ?"
        puts " "
        puts "a - chercher une meilleure arme"
        puts "s - chercher à se soigner "
        puts " "
        puts "attaquer un joueur en vue :"
        
        for i in 0...@enemies_in_sight.size
            puts "#{i} - #{@enemies_in_sight[i].show_state}"
        end
           print ">"
        choice = gets.chomp
        
        case choice

        when "a"
            @human_player.search_weapon
        when "s"
            @human_player.search_health_pack
        when "0"
            @human_player.attacks(@enemies_in_sight[0])
        when "1"
            @human_player.attacks(@enemies_in_sight[1])
        when "2"
            @human_player.attacks(@enemies_in_sight[2])
        when "3"
            @human_player.attacks(@enemies_in_sight[3])
        when "4"
            @human_player.attacks(@enemies_in_sight[4])
        when "5"
            @human_player.attacks(@enemies_in_sight[5])
        when "6"
            @human_player.attacks(@enemies_in_sight[6])
        when "7"
            @human_player.attacks(@enemies_in_sight[7])
        when "8"
            @human_player.attacks(@enemies_in_sight[8])
        when "9"
            @human_player.attacks(@enemies_in_sight[9])
        end

        @enemies_in_sight.each do |enemie|
            if enemie.life_points <= 0
                kill_player(enemie)
            end 
        end
    end
    
    #fonction de l'attaque des IA
    def enemies_attack
        @enemies_in_sight.each do |enemie|
            enemie.attacks(@human_player)
        end
    end

    #fonction de la fin du jeu
    def end 
        puts "La partie est terminé"

        if @human_player.life_points > 0
            puts "BRAVO ! TU AS GAGNE !"
        else
            puts "Loser ! Tu as perdu !"
        end
    end

    #fonction pour inserer des ennemies aleatoires sur le terrain
    def new_players_in_sight
        #si ennemi sur terrain est au ennemi restant, on n'ajoute plus sur le terrain
        if @enemies_in_sight.size == on_field_limits 
            puts "Plus aucun ennemi ne peut être ajouté "
        
        else

            dice_num = rand(1..6)

            case dice_num

            when 1
            "aucun nouvel ennemi n'apparait"
            when 2..4
                name_num = rand(0...10000) 
                enemie = Player.new("Gobelin_#{name_num}")
                @enemies_in_sight << enemie
                puts "un nouvel ennemi apparait : #{enemie}"
            when 5..6
                for i in 0..1
                    new_enemies = []
                    name_num = rand(0...10000) 
                    enemie = Player.new("Gobelin_#{name_num}")
                    new_enemies << enemie
                end
                puts "Deux nouveaux ennemis apparaissent "
                new_enemies.each do |enemie|
                @enemies_in_sight << enemie
                end
            end
        end
    end

    def show_enemies
        puts "il reste #{@players_left} ennemies encore en vie dont #{@enemies_in_sight.size} sont sur le terrain "
    end

    def on_field_limits
        if @enemies_in_sight.size == 10
            return true
        end
        return false
    end

end