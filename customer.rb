class Customer

    attr_reader :name, :wallet, :age, :drunkenness

    def initialize(name, wallet, age)
        @name = name
        @wallet = wallet
        @age = age
        @drunkenness = 0
    end

    def remove_cash(amount)
        @wallet -= amount
    end

    def buy_drink_from_pub(drink, pub)
        if pub.is_of_age(self) == true
            remove_cash(drink.price)
            down_drink(drink)
            pub.increase_till(drink.price)
        end
        
    end

    def down_drink(drink)
        @drunkenness += drink.alcohol_level()
    end

    def eat_food(food)
        @drunkenness -= food.rejuvenation_level()
    end


    def buy_food_from_pub(food, pub)
        remove_cash(food.price)
        eat_food(food)
        pub.increase_till(food.price)
    end


    
end