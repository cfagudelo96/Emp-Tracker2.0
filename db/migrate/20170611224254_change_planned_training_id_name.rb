class ChangePlannedTrainingIdName < ActiveRecord::Migration[5.0]
  def change
    rename_column :training_executions, :planned_training_id, :training_id
  end
end
