require "application_system_test_case"

class CollabsTest < ApplicationSystemTestCase
  setup do
    @collab = collabs(:one)
  end

  test "visiting the index" do
    visit collabs_url
    assert_selector "h1", text: "Collabs"
  end

  test "should create collab" do
    visit collabs_url
    click_on "New collab"

    fill_in "Collab contact", with: @collab.collab_contact
    fill_in "Collab email", with: @collab.collab_email
    fill_in "Collab name", with: @collab.collab_name
    fill_in "Collab organiser", with: @collab.collab_organiser
    fill_in "Collab website", with: @collab.collab_website
    click_on "Create Collab"

    assert_text "Collab was successfully created"
    click_on "Back"
  end

  test "should update Collab" do
    visit collab_url(@collab)
    click_on "Edit this collab", match: :first

    fill_in "Collab contact", with: @collab.collab_contact
    fill_in "Collab email", with: @collab.collab_email
    fill_in "Collab name", with: @collab.collab_name
    fill_in "Collab organiser", with: @collab.collab_organiser
    fill_in "Collab website", with: @collab.collab_website
    click_on "Update Collab"

    assert_text "Collab was successfully updated"
    click_on "Back"
  end

  test "should destroy Collab" do
    visit collab_url(@collab)
    click_on "Destroy this collab", match: :first

    assert_text "Collab was successfully destroyed"
  end
end
