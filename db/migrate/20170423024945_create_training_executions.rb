class CreateTrainingExecutions < ActiveRecord::Migration[5.0]
  def change
    create_table :training_executions do |t|
      t.integer :planned_training_id
      t.boolean :planned
      t.integer :training_id

      t.timestamps
    end
  end
end
