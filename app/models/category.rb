class Category < ApplicationRecord
    belongs_to :event
    has_many :participants
    validates :category_fees, :numericality => { :greater_than_or_equal_to => 0 }
end
