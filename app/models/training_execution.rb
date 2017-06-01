class TrainingExecution < ApplicationRecord
  has_many :attendances
  has_many :employees, through: :attendances

  belongs_to :company

  self.per_page = 10

  validates :category, presence: true
  validates :topic, presence: true
  validates :date, presence: true
  validates :hourly_intensity, numericality: { greater_than_or_equal_to: 0 }
  validates :trainer, presence: true
  validates :company_id, presence: true

  validate :area_collaborator_validator

  def area_collaborator_validator
    if area_id.blank? && collaborator_id.blank?
      errors.add(:area_id, 'can not be blank if collaborator is also blank')
      errors.add(:collaborator_id, 'can not be blank if area is also blank')
    elsif area_id.present? && collaborator_id.present?
      errors.add(:area_id, 'can not be present if collaborator is also present')
      errors.add(:collaborator_id, 'can not be present if area is also present')
    end
  end

  def to_s
    topic
  end
end
