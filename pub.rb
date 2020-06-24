class Pub
    
    attr_reader :name, :till, :drinks

    def initialize(name, drinks)
        @name = name
        @till = 150.0
        @drinks = drinks
    end

    def get_drink(requested_drink_name)
               
        for drink in @drinks
            if drink[:drink].name == requested_drink_name
                return drink[:drink]
            end
        end
        return nil
    end
   
    def get_drinks_array()
        return @drinks.length
    end

    def increase_till(amount)
        @till += amount
    end

    def is_of_age(customer)
        if customer.age >= 18
            return true
        end
        return false
    end

    def check_if_too_drunk(customer)
        if customer.drunkenness() >= 20
            return "No more for you"  
        else
            return nil
        end
    end

    def check_stock_individual(requested_drink_name)
        for drink in @drinks
            if drink[:stock] > 0 && drink[:drink].name == requested_drink_name
                return drink[:drink]
            end
        end
        return nil
    end

    def stock_value()
        total_stock = 0
        for drink in @drinks
            total_stock += drink[:stock]
        end
        return total_stock
    end


end