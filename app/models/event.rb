class Event < ApplicationRecord
    has_many :results
    has_many :users

    has_one_attached :eventpicture
end
