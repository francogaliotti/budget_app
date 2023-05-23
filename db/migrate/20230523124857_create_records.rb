class CreateRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :records do |t|
      t.string :title
      t.integer :amount
      t.boolean :is_income

      t.timestamps
    end
  end
end
