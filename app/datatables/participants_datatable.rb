class ParticipantsDatatable < AjaxDatatablesRails::ActiveRecord

  def view_columns
    @view_columns ||= {
      id:         { source: "Participant.user_id" },
      event_id:  { source: "Participant.event_id"},
      email: { source: "Participant.participant_email, cond: :like, searchable: true, orderable: true"},
      category:      { source: "Participant.participant_category"},
    }
  end

  def data
    records.map do |record|
      {
        id:         record.id,
        event_id:  record.event_id,
        email: record.email,
        category:      record.category
      }
    end
  end

  def get_raw_records
      participants = Participant.all
  end

end
