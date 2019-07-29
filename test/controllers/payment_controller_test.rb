require 'test_helper'

class PaymentControllerTest < ActionDispatch::IntegrationTest
  test "should get summary" do
    get payment_summary_url
    assert_response :success
  end

end
