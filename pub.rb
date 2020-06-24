class Pub
    
    attr_reader :name, :till, :drinks

    def initialize(name, drinks)
        @name = name
        @till = 150.0
        @drinks = drinks 
        # drinks is an array with hashes
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

end
    # def get_drink_price(requested_drink_name)         
    #     return get_drink_name(requested_drink_name).price
    # end
   

    #class Pub

    # initialise(name, drinks)

    #@drinks = drinks
    #stock = for each drink passed to stock, add a counter for that drink type
    # 

    #  drinks [drink1, drink2, drink3]

    #  stock = {}
