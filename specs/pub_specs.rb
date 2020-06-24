require("minitest/autorun")
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../pub")
require_relative("../customer")
require_relative("../drink")
require_relative("drink_specs")

class PubTest < MiniTest::Test

    def setup()
        @pub = Pub.new("Shandwicks", [@drink1, @drink2, @drink3])
    end

    def test_get_pub_name()
        assert_equal("Shandwicks", @pub.name())
    end

    def test_get_drink()
        @pub.get_drink("Carling")
        assert_equal("Carling", @drink1.drink_name)
    end
    
end