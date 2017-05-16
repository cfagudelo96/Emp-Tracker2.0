class Attendance < ApplicationRecord
  belongs_to :employee
  belongs_to :training_execution
end
