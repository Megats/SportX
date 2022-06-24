class Event < ApplicationRecord
    has_many :results, dependent: :destroy
    has_many :participants

    has_one_attached :eventpicture
end
