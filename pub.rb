class Pub
    
    attr_reader :name, :till, :drinks

    def initialize(name, drinks)
        @name = name
        @till = 150.0
        @drinks = drinks
    end

    def get_drink(requested_drink_name)
               
        for drink in @drinks
            if drink.name == requested_drink_name
                return drink
            end
        end
        return nil
    end
   
    def get_drinks_array()
        return @drinks.length
    end

end