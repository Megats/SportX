class Collab < ApplicationRecord
    has_many :donations
    has_one_attached :collab_image
end
