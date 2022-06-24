require "application_system_test_case"

class ParticipantsTest < ApplicationSystemTestCase
  setup do
    @participant = participants(:one)
  end

  test "visiting the index" do
    visit participants_url
    assert_selector "h1", text: "Participants"
  end

  test "should create participant" do
    visit participants_url
    click_on "New participant"

    fill_in "Event", with: @participant.event_id
    fill_in "Participant cor", with: @participant.participant_COR
    fill_in "Participant category", with: @participant.participant_category
    fill_in "Participant email", with: @participant.participant_email
    fill_in "Participant nationality", with: @participant.participant_nationality
    fill_in "Participants dob", with: @participant.participants_dob
    fill_in "Paticipant nric", with: @participant.paticipant_NRIC
    fill_in "User", with: @participant.user_id
    click_on "Create Participant"

    assert_text "Participant was successfully created"
    click_on "Back"
  end

  test "should update Participant" do
    visit participant_url(@participant)
    click_on "Edit this participant", match: :first

    fill_in "Event", with: @participant.event_id
    fill_in "Participant cor", with: @participant.participant_COR
    fill_in "Participant category", with: @participant.participant_category
    fill_in "Participant email", with: @participant.participant_email
    fill_in "Participant nationality", with: @participant.participant_nationality
    fill_in "Participants dob", with: @participant.participants_dob
    fill_in "Paticipant nric", with: @participant.paticipant_NRIC
    fill_in "User", with: @participant.user_id
    click_on "Update Participant"

    assert_text "Participant was successfully updated"
    click_on "Back"
  end

  test "should destroy Participant" do
    visit participant_url(@participant)
    click_on "Destroy this participant", match: :first

    assert_text "Participant was successfully destroyed"
  end
end
