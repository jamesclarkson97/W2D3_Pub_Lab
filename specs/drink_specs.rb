require("minitest/autorun")
require('minitest/reporters')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../drink')

class DrinkTest < MiniTest::Test

    def setup()
        @drink1 = Drink.new("Carling", 1.75, 2)
        @drink2 = Drink.new("Hop House 13", 2.00, 3)
        @drink3 = Drink.new("Smirnoff", 1.50, 4)
    end

    def test_get_drink_by_name()
        assert_equal("Carling", @drink1.name())
    end

    def test_get_drink_by_price()
        assert_equal(1.75, @drink1.price())
    end

    def test_get_alcohol_level()
        assert_equal(4, @drink3.alcohol_level())
    end

end