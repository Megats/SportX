class Event < ApplicationRecord
    has_many :results, dependent: :destroy
    has_many :participants, dependent: :destroy
    has_many :categories, dependent: :destroy
    accepts_nested_attributes_for :categories, reject_if: :all_blank, allow_destroy: true

    has_one_attached :eventpicture
    has_rich_text :event_overview
end
