class CreateTrainings < ActiveRecord::Migration[5.0]
  def change
    create_table :trainings do |t|
      t.string :type
      t.string :topic
      t.text :objective
      t.integer :company_id
      t.datetime :date
      t.float :hourly_intensity
      t.string :trainer
      t.boolean :internal
      t.boolean :planned
      t.integer :planned_training_id

      t.timestamps
    end
  end
end

