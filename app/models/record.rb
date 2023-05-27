class Record < ApplicationRecord
    validates_presence_of :title, message: 'Debe llevar un título'
    validates_presence_of :date, message: 'Debe especificar la fecha'
    validates_length_of :amount, :minimum => 1
    validate :date_cannot_be_in_the_future
    belongs_to :category
    belongs_to :user

    scope :incomes, -> { joins(:category).where(categories: { is_income: 1 }) }
    scope :expenses, -> { joins(:category).where(categories: { is_income: 0 }) }
    scope :order_amount_desc, -> { order('amount DESC') }

    def date_cannot_be_in_the_future
        if date.present? && date > Date.today
          errors.add(:date, "No puede ser una fecha futura")
        end
    end
end