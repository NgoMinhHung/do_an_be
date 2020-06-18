class TransactionItem < ApplicationRecord
  belongs_to :user 
  has_and_belongs_to_many :categories
  enum transaction_type: { income: 'income', outcome: 'outcome' }
  enum source: { atm: 'atm', cash: 'cash' }
  
  scope :in_date, ->(date){ where("DATE(time) = ?", date.to_date) }
  scope :in_week, ->(date){ where("extract(week from time) = ?", date.cweek) }
  scope :in_month, ->(date){ where("extract(month from time) = ?", date.month) }
  scope :in_year, ->(date){ where("extract(year from time) = ?", date.year) }
  scope :of_category, ->(id){ joins(:categories).where("category_id = ?", id) }
  
end
