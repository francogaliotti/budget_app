class Record < ApplicationRecord
    validates_presence_of :title, message: 'Debe llevar un título'
    validates_length_of :amount, :minimum => 1
    belongs_to :category
    belongs_to :user
end
