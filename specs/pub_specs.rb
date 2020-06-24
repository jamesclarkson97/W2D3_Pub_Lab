require("minitest/autorun")
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../pub")
require_relative("../customer")
require_relative("../drink")
require_relative("drink_specs")

class PubTest < MiniTest::Test

    def setup()
        @drink1 = Drink.new("Carling", 1.75)
        @drink2 = Drink.new("Hop House 13", 2.00)
        @drink3 = Drink.new("Smirnoff", 1.50)
        @pub = Pub.new("Shandwicks", [@drink1, @drink2, @drink3])
        @customer = Customer.new("Stephen", 20.00, 25)
    end

    def test_get_pub_name()
        assert_equal("Shandwicks", @pub.name())
    end

    def test_get_drink()
        drink = @pub.get_drink("Carling")
        assert_equal(@drink1, drink)
    end

    # def test_get_drinks_array()
    #     p @drink1.drink_name
    #     p @pub.drinks[0]
    #     p @pub.drinks[1]
    #     p @pub.drinks[2]
    #     assert_equal(3, @pub.drinks.length)
    # end
    
    def test_increase_till()
        @pub.increase_till(1.50)
        assert_equal(151.50, @pub.till)
    end

    def test_is_of_age()
        assert_equal(true, @pub.is_of_age(@customer))
    end

end