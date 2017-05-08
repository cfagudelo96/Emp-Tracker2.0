class CreateTrainingExecutions < ActiveRecord::Migration[5.0]
  def change
    create_table :training_executions do |t|
      t.string :category
      t.string :topic
      t.text :objective
      t.datetime :date
      t.float :hourly_intensity
      t.string :trainer
      t.boolean :internal
      t.integer :area_id
      t.integer :collaborator_id
      t.integer :company_id
      t.integer :planned_training_id
      t.boolean :planned

      t.timestamps
    end
  end
end
