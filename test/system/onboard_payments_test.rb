require "application_system_test_case"

class OnboardPaymentsTest < ApplicationSystemTestCase
  setup do
    @onboard_payment = onboard_payments(:one)
  end

  test "visiting the index" do
    visit onboard_payments_url
    assert_selector "h1", text: "Onboard payments"
  end

  test "should create onboard payment" do
    visit onboard_payments_url
    click_on "New onboard payment"

    fill_in "Onboard", with: @onboard_payment.onboard
    click_on "Create Onboard payment"

    assert_text "Onboard payment was successfully created"
    click_on "Back"
  end

  test "should update Onboard payment" do
    visit onboard_payment_url(@onboard_payment)
    click_on "Edit this onboard payment", match: :first

    fill_in "Onboard", with: @onboard_payment.onboard
    click_on "Update Onboard payment"

    assert_text "Onboard payment was successfully updated"
    click_on "Back"
  end

  test "should destroy Onboard payment" do
    visit onboard_payment_url(@onboard_payment)
    click_on "Destroy this onboard payment", match: :first

    assert_text "Onboard payment was successfully destroyed"
  end
end
