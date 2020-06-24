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

    def buy_drink_from_pub(drink, customer, pub)
        if pub.is_of_age(customer) == true
            customer.remove_cash(drink.price)
            pub.increase_till(drink.price)
        end
    end

   def down_drink(drink)
        @drunkenness += drink.alcohol_level()
   end


    
end

    # def reduce_wallet(requested_drink_name)
    #     price = @pub.get_drink_price(requested_drink_name)
    #     @wallet -= price
    # end


    # def buy_drink(drink_name)


