class Result < ApplicationRecord
    belongs_to :events
    has_many :artists, dependent: :destroy
end
