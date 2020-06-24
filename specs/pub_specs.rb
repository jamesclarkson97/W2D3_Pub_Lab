require("minitest/autorun")
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../pub")
require_relative("../customer")
require_relative("../drink")
require_relative("../food")

class PubTest < MiniTest::Test

    def setup()
        @drink1 = Drink.new("Carling", 1.75, 2)
        @drink2 = Drink.new("Hop House 13", 2.00, 3)
        @drink3 = Drink.new("Smirnoff", 1.50, 4)
        @pub = Pub.new("Shandwicks", [
            {:drink => @drink1, 
            :stock => 5},
             {:drink => @drink2, 
             :stock => 6}, 
             {:drink => @drink3, 
             :stock => 3}])
        @customer = Customer.new("Stephen", 20.00, 25)
        @customer2 = Customer.new("James", 500.00, 15)
    end

    def test_get_pub_name()
        assert_equal("Shandwicks", @pub.name())
    end

    def test_get_drink()
        drink = @pub.get_drink("Carling")
        assert_equal(@drink1, drink)
    end

    def test_check_if_too_drunk__nil()
        assert_nil(@pub.check_if_too_drunk(@customer))
    end

    def test_check_if_too_drunk__too_drunk()
        assert_equal("No more for you", @pub.check_if_too_drunk(@customer))
    end
    
    def test_increase_till()
        @pub.increase_till(1.50)
        assert_equal(151.50, @pub.till)
    end

    def test_is_of_age()
        assert_equal(true, @pub.is_of_age(@customer))
    end

    def test_check_stock_individual()
        drink = @pub.check_stock_individual("Carling")
        assert_equal(@drink1, drink)
    end

    def test_stock_value()
        assert_equal(14, @pub.stock_value())
    end

end