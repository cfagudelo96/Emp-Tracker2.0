class Employee < ApplicationRecord
  has_many :attendances
  has_many :training_executions, through: :attendances

  belongs_to :area
  belongs_to :company

  validates :name, presence: true
  validates :identification, uniqueness: true, numericality: { greater_than: 0 }
  validates :admission_date, presence: true

  def to_s
    name
  end
end
