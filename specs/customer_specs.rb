require("minitest/autorun")
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../customer")


class CustomerTest < MiniTest::Test

    def setup()
        @customer = Customer.new("Stephen", 20.00)
    end

    def test_get_name()
        assert_equal("Stephen", @customer.name())
    end

    def test_get_wallet()
        assert_equal(20.00, @customer.wallet())
    end
    
end