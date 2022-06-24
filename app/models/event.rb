class Event < ApplicationRecord
    has_many :results, dependent: :destroy
    has_many :users

    has_one_attached :eventpicture

    def resize_eventpic
        eventpicture.variant(resize_to_limit: [300, 300]).processed
    end
end
