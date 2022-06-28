class Category < ApplicationRecord
    belongs_to :event
    validates :category_fees, :numericality => { :greater_than_or_equal_to => 0 }
end
