class CreateAttendances < ActiveRecord::Migration[5.0]
  def change
    create_table :attendances do |t|
      t.integer :training_execution_id
      t.integer :employee_id

      t.timestamps
    end
  end
end
