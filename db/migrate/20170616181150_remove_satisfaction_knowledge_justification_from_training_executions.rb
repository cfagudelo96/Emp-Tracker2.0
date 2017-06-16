class RemoveSatisfactionKnowledgeJustificationFromTrainingExecutions < ActiveRecord::Migration[5.0]
  def change
    remove_column :training_executions, :satisfaction, :decimal
    remove_column :training_executions, :knowledge, :decimal
    remove_column :training_executions, :justification, :decimal
  end
end
