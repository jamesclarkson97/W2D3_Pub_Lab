require("minitest/autorun")
require('minitest/reporters')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../food')

class FoodTest < MiniTest::Test

    def setup()
        @food1 = Food.new("Chips", 1.50, 3)
        @food2 = Food.new("Burger", 4.00, 4)
        @food3 = Food.new("Onion rings", 1.00, 2)
    end

    def test_get_food_by_name()
        assert_equal("Chips", @food1.name())
    end

    def test_get_food_by_price()
        assert_equal(4.00, @food2.price())
    end

    def test_get_rejuvenation_level()
        assert_equal(2, @food3.rejuvenation_level())
    end

end