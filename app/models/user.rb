class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :records, dependent: :destroy

  enum role: { normal: 0, admin: 1 }

  def get_total_amount 
    total_amount = 0
    self.records.each do |record|
      if record.category.is_income
        total_amount += record.amount
      else
        total_amount -= record.amount
      end
    end
    total_amount
  end

end
