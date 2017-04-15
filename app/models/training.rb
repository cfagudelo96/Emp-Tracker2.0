class Training < ApplicationRecord
  CATEGORIES = %w(Capacitación Inducción Entrenamiento Otro)

  validates :category, presence: true
  validates :topic, presence: true
  validates :date, presence: true
  validates :hourly_intensity, numericality: { greater_than_or_equal_to: 0 }
  validate :objective_validator

  def objective_validator
    if planned && objective.blank?
      errors.add(:objective, 'can not be present if the training was planned')
    elsif !planned && objective.present?
      errors.add(:objective, 'can not be blank if the training was not planned')
    end
  end

  def to_s
    topic
  end
end
