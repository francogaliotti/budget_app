class Category < ApplicationRecord
    has_many :records, dependent: :destroy
end
