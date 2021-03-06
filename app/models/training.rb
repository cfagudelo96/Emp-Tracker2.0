class Training < ApplicationRecord
  CATEGORIES = %w[Capacitación Inducción Entrenamiento Otro].freeze
  FILTER_OPTIONS = [
    %w[Categoría category],
    %w[Tema topic],
    %w[Fecha date],
    %w[Área area_id],
    %w[Colaborador collaborator],
    %w[Compañía company_id]
  ].freeze

  has_many :training_executions

  belongs_to :company

  validates :category, presence: true
  validates :topic, presence: true
  validates :objective, presence: true
  validates :date, presence: true
  validates :hourly_intensity, numericality: { greater_than_or_equal_to: 0 }
  validates :trainer, presence: true

  scope :by_category, (->(category) { where('category like ?', "%#{category}%") })
  scope :by_topic, (->(topic) { where('topic like ?', "%#{topic}%") })
  scope :by_date, (->(initial_date, final_date) { where(date: initial_date..final_date) })
  scope :by_area, (->(area_id) { where(area_id: area_id) })
  scope :by_collaborator, (->(collaborator) { where(collaborator_id: Employee.by_name(collaborator).select(:id)) })
  scope :by_company, (->(company_id) { where(company_id: company_id) })

  def self.filter_trainings(params)
    @trainings = Training.all
    @trainings = @trainings.by_category(params[:category]) if params[:category].present?
    @trainings = @trainings.by_topic(params[:topic]) if params[:topic].present?
    @trainings = @trainings.by_date(params[:initial_date].to_time, params[:final_date].to_time) if params[:initial_date].present? && params[:final_date].present?
    @trainings = @trainings.by_area(params[:area_id]) if params[:area_id].present?
    @trainings = @trainings.by_collaborator(params[:collaborator]) if params[:collaborator].present?
    @trainings = @trainings.by_company(params[:company_id]) if params[:company_id].present?
    @trainings
  end

  def to_s
    topic
  end
end
