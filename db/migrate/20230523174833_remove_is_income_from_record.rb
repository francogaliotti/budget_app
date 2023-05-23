class RemoveIsIncomeFromRecord < ActiveRecord::Migration[7.0]
  def change
    remove_column :records, :is_income, :boolean
  end
end
