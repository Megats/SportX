require "test_helper"

class OnboardPaymentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @onboard_payment = onboard_payments(:one)
  end

  test "should get index" do
    get onboard_payments_url
    assert_response :success
  end

  test "should get new" do
    get new_onboard_payment_url
    assert_response :success
  end

  test "should create onboard_payment" do
    assert_difference("OnboardPayment.count") do
      post onboard_payments_url, params: { onboard_payment: { onboard: @onboard_payment.onboard } }
    end

    assert_redirected_to onboard_payment_url(OnboardPayment.last)
  end

  test "should show onboard_payment" do
    get onboard_payment_url(@onboard_payment)
    assert_response :success
  end

  test "should get edit" do
    get edit_onboard_payment_url(@onboard_payment)
    assert_response :success
  end

  test "should update onboard_payment" do
    patch onboard_payment_url(@onboard_payment), params: { onboard_payment: { onboard: @onboard_payment.onboard } }
    assert_redirected_to onboard_payment_url(@onboard_payment)
  end

  test "should destroy onboard_payment" do
    assert_difference("OnboardPayment.count", -1) do
      delete onboard_payment_url(@onboard_payment)
    end

    assert_redirected_to onboard_payments_url
  end
end
