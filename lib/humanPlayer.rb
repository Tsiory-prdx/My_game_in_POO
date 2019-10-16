#class HumanPlayer  heritier de Player
class HumanPlayer < Player

#Creation des attributs de la classe
    attr_accessor :weapon_level

#fonction de demarrage  de creation du hero
    def initialize(name_of_human_player)
        @name = name_of_human_player
        @life_points = 100
        @weapon_level = 1
    end

#la meme fonction show_state que player mais avec un autre parametre Weapon
    def show_state
        if @life_points < 0
            @life_points = 0
        end
        puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}"
    end

#nouvel generator de degat multiplié par le niveau de l'arme
    def compute_damage
        rand(1..6) * @weapon_level
    end

#creation de programme de lancer de dé
    def dice_launch
        rand(1..6)
    end

#programme de recherche d'arme
    def search_weapon
#lancer de dé
        new_weapon_level = dice_launch
        puts "Tu as trouvé une arme de niveau #{new_weapon_level}"
#condition de changement d'arme
        if new_weapon_level > @weapon_level
            
            @weapon_level = new_weapon_level
            puts "Youhou! elle est meilleur que ton arme actuelle : tu la prends"
        
        else  
            
            puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
        
        end

    end

    #programme de recherche de pack de soin
    def search_health_pack
    #lancer de dé
        dice_numb = dice_launch
        #fonction case de la condition de soin
        case dice_numb

        when  1
            puts "Tu n'as rien trouvé... "

        when  2..5
            @life_points = @life_points + 50 

            if @life_points > 100
                    @life_points = 100
            end

                puts  "Bravo, tu as trouvé un pack de +50 points de vie !"

        when  6
                @life_points = @life_points + 80 

            if @life_points > 100
                    @life_points = 100
            end

                puts "Waow, tu as trouvé un pack de +80 points de vie !"
        end
    end

end    