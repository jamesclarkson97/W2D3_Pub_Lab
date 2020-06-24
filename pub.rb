class Pub
    
    attr_reader :name, :till, :drinks

    def initialize(name, drinks)
        @name = name
        @till = 150.0
        @drinks = drinks
    end

    def get_drink(requested_drink)
        for drink in @drinks
            if @drinks.drink_name() == requested_drink
                return drink.drink_name()
            end
        end
        return nil
    end
    
end