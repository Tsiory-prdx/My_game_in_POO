class Player

#Creation des attributs de la classe
    attr_accessor :name, :life_points
    
#Creation de la methode de depart
    def initialize(player_s_name)
        #definir que l'attribut @name est egal au parametre de la fonction de demarrage
        @name = player_s_name
        #initialisation des HP_joueur à  HP
        @life_points = 10
    end

    #Definition de la methode montrer l'etat du joueur
    def show_state
        #condition d'affichage si HP<0 afficher HP = 0
        if @life_points < 0
            @life_points = 0
        end
#Etat du joueur à afficher en fonction du nom et des HP
        puts "#{@name} a #{@life_points} points de vie"
    end

    #Creation de la methode recevoir des degats 
    def gets_damage(damage_received)
#ici, on definit la soustraction des degats au HP 
        @life_points = @life_points - damage_received
#un joueur meurt si HP <= 0 
        if @life_points <= 0
            puts "le joueur #{@name} a été tué"
        end
    end


    #definition de la fonction d'attaque
    def attacks(player_to_hit)

        name_player_to_hit = player_to_hit.name
        hit_power = compute_damage

        puts " #{@name} attaque #{name_player_to_hit}"

        puts "Il lui inflige #{hit_power} points de dommages."
        
        player_to_hit.gets_damage(hit_power)
        
    end    

#fonction aleatoire de la puissance de frappe
    def compute_damage
        return rand(1..6)
    end
end


