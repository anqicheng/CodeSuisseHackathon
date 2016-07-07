class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :symbol
      t.float :pr01
      t.float :pr02
      t.float :pr04
      t.float :pr13
      t.float :pr26
      t.float :pr03
      t.float :pr39
      t.float :pr52
      t.integer :pr_year_to_date
      t.float :price_current
      t.float :warranted_price
      t.float :per_FY1
      t.float :per_FY2
      t.float :per_LFY

      t.timestamps null: false
    end
  end
end
