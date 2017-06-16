class ChangeTrainingExecutions < ActiveRecord::Migration[5.0]
  def change
    add_column :training_executions, :cost, :decimal
    add_column :training_executions, :satisfaction, :decimal
    add_column :training_executions, :knowledge, :decimal
    add_column :training_executions, :justification, :decimal
    add_column :training_executions, :observations, :text
  end
end
