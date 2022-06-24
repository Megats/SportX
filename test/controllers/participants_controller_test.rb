require "test_helper"

class ParticipantsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @participant = participants(:one)
  end

  test "should get index" do
    get participants_url
    assert_response :success
  end

  test "should get new" do
    get new_participant_url
    assert_response :success
  end

  test "should create participant" do
    assert_difference("Participant.count") do
      post participants_url, params: { participant: { event_id: @participant.event_id, participant_COR: @participant.participant_COR, participant_category: @participant.participant_category, participant_email: @participant.participant_email, participant_nationality: @participant.participant_nationality, participants_dob: @participant.participants_dob, paticipant_NRIC: @participant.paticipant_NRIC, user_id: @participant.user_id } }
    end

    assert_redirected_to participant_url(Participant.last)
  end

  test "should show participant" do
    get participant_url(@participant)
    assert_response :success
  end

  test "should get edit" do
    get edit_participant_url(@participant)
    assert_response :success
  end

  test "should update participant" do
    patch participant_url(@participant), params: { participant: { event_id: @participant.event_id, participant_COR: @participant.participant_COR, participant_category: @participant.participant_category, participant_email: @participant.participant_email, participant_nationality: @participant.participant_nationality, participants_dob: @participant.participants_dob, paticipant_NRIC: @participant.paticipant_NRIC, user_id: @participant.user_id } }
    assert_redirected_to participant_url(@participant)
  end

  test "should destroy participant" do
    assert_difference("Participant.count", -1) do
      delete participant_url(@participant)
    end

    assert_redirected_to participants_url
  end
end
