require("minitest/autorun")
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../customer")
require_relative("../drink")
require_relative("../pub")
require_relative('../food')


class CustomerTest < MiniTest::Test

    def setup()
        @pub = Pub.new("Shandwicks", [@drink1, @drink2, @drink3])
        @customer = Customer.new("Stephen", 20.00, 25)
        @customer2 = Customer.new("James", 500.00, 15)
        @drink1 = Drink.new("Carling", 1.75, 2)
        @drink2 = Drink.new("Hop House 13", 2.00, 3)
        @drink3 = Drink.new("Smirnoff", 1.50, 4)    
        @food1 = Food.new("Chips", 1.50, 3)
        @food2 = Food.new("Burger", 4.00, 4)
        @food3 = Food.new("Onion rings", 1.00, 2)
    end

    def test_get_name()
        assert_equal("Stephen", @customer.name())
    end

    def test_get_wallet()
        assert_equal(20.00, @customer.wallet())
    end
        
    def test_get_age()
        assert_equal(25, @customer.age())
    end

    def test_get_drunkenness()
        assert_equal(0, @customer.drunkenness())
    end

    def test_remove_cash()
        @customer.remove_cash(1.50)
        assert_equal(18.50, @customer.wallet())
    end
    
    def test_buy_drink_from_pub__of_age()
        @customer.buy_drink_from_pub(@drink3, @pub)
        assert_equal(18.50, @customer.wallet())
        assert_equal(151.50, @pub.till())
        assert_equal(true, @pub.is_of_age(@customer))
    end

    def test_buy_drink_from_pub__underage()
        @customer2.buy_drink_from_pub(@drink3, @pub)
        assert_equal(500.00, @customer2.wallet())
        assert_equal(150.00, @pub.till())
        assert_equal(false, @pub.is_of_age(@customer2))
    end

    def test_down_drink()
        @customer.down_drink(@drink1)
        assert_equal(2, @customer.drunkenness())
    end

    def test_get_too_drunk()
        while @pub.check_if_too_drunk(@customer) == nil
            @customer.down_drink(@drink3)
        end
        assert_equal(20, @customer.drunkenness())
    end

    def test_buy_food_from_pub()
        @customer.buy_food_from_pub(@food3, @pub)
        assert_equal(19.00, @customer.wallet())
        assert_equal(151.00, @pub.till())
    end

    def test_eat_food()
        @customer.down_drink(@drink2)
        @customer.eat_food(@food3)
        assert_equal(1, @customer.drunkenness())
    end
end