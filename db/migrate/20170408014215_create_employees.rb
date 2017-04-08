class CreateEmployees < ActiveRecord::Migration[5.0]
  def change
    create_table :employees do |t|
      t.string :name
      t.integer :identification
      t.integer :area_id
      t.date :admission_date
      t.boolean :active
      t.string :position
      t.integer :company_id

      t.timestamps
    end
  end
end
