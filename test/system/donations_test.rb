require "application_system_test_case"

class DonationsTest < ApplicationSystemTestCase
  setup do
    @donation = donations(:one)
  end

  test "visiting the index" do
    visit donations_url
    assert_selector "h1", text: "Donations"
  end

  test "should create donation" do
    visit donations_url
    click_on "New donation"

    fill_in "Donation cor", with: @donation.donation_COR
    fill_in "Donation nric", with: @donation.donation_NRIC
    fill_in "Donation amount", with: @donation.donation_amount
    fill_in "Donation dob", with: @donation.donation_dob
    fill_in "Donation email", with: @donation.donation_email
    fill_in "Donation nationality", with: @donation.donation_nationality
    fill_in "User", with: @donation.user_id
    click_on "Create Donation"

    assert_text "Donation was successfully created"
    click_on "Back"
  end

  test "should update Donation" do
    visit donation_url(@donation)
    click_on "Edit this donation", match: :first

    fill_in "Donation cor", with: @donation.donation_COR
    fill_in "Donation nric", with: @donation.donation_NRIC
    fill_in "Donation amount", with: @donation.donation_amount
    fill_in "Donation dob", with: @donation.donation_dob
    fill_in "Donation email", with: @donation.donation_email
    fill_in "Donation nationality", with: @donation.donation_nationality
    fill_in "User", with: @donation.user_id
    click_on "Update Donation"

    assert_text "Donation was successfully updated"
    click_on "Back"
  end

  test "should destroy Donation" do
    visit donation_url(@donation)
    click_on "Destroy this donation", match: :first

    assert_text "Donation was successfully destroyed"
  end
end
