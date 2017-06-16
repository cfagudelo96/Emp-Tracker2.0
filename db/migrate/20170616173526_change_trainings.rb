class ChangeTrainings < ActiveRecord::Migration[5.0]
  def change
    add_column :trainings, :cost, :decimal
  end
end
