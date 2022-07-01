class Category < ApplicationRecord
    belongs_to :event
    has_many :participants, dependent: :destroy

    validates :category_id, presence: true

end
