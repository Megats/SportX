class Collab < ApplicationRecord
    has_many :donations, dependent: :destroy
    has_one_attached :collab_image
end
