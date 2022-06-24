class Event < ApplicationRecord
    has_many :results, dependent: :destroy
    has_many :users

    has_one_attached :eventpicture


end
