class BudgetSerializer < ActiveModel::Serializer
  attributes :id, :total, :atm, :cash, :has_limited_outcome_per_week, :limited_outcome_per_week, :has_limited_outcome_per_month, :limited_outcome_per_month
end
