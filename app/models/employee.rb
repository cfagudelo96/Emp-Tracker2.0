class Employee < ApplicationRecord
  FILTER_OPTIONS = [
    %w[Nombre name],
    %w[Identificación identification],
    %w[Posición position],
    %w[Fecha\ de\ ingreso admission_date],
    %w[Área area_id],
    %w[Compañía company_id],
    %w[Sin\ capacitaciones without_trainings]
  ].freeze

  has_many :attendances
  has_many :training_executions, through: :attendances
  has_many :planned_trainings, foreign_key: :collaborator_id, class_name: Training
  has_many :trainings_given, foreign_key: :collaborator_id, class_name: TrainingExecution

  belongs_to :area
  belongs_to :company

  validates :name, presence: true
  validates :identification, uniqueness: true, numericality: { greater_than: 0 }
  validates :admission_date, presence: true

  scope :by_name, (->(name) { where('name like ?', "%#{name}%") })
  scope :by_identification, (->(identification) { where identification: identification })
  scope :by_position, (->(position) { where('position like ?', "%#{position}%") })
  scope :by_area, (->(area_id) { where(area_id: area_id) })
  scope :by_company, (->(company_id) { where company_id: company_id })
  scope :active, (-> { where active: true })
  scope :by_admission_date, (->(initial_date, final_date) { where(admission_date: initial_date..final_date) })
  scope :without_trainings_between_dates, (->(initial_date, final_date) { where.not(id: joins(:training_executions).where(training_executions: { date: initial_date..final_date }).select(:id).distinct) })

  def self.filter_employees(params)
    @employees = Employee.all
    @employees = @employees.by_name(params[:name]) if params[:name].present?
    @employees = @employees.by_identification(params[:identification]) if params[:identification].present?
    @employees = @employees.by_position(params[:position]) if params[:position].present?
    @employees = @employees.by_area(params[:area_id]) if params[:area_id].present?
    @employees = @employees.by_company(params[:company_id]) if params[:company_id].present?
    @employees = @employees.active if params[:active]
    @employees = @employees.by_admission_date(params[:initial_date].to_time, params[:final_date].to_time) if params[:initial_date].present? && params[:final_date].present?
    @employees = @employees.without_trainings_between_dates(params[:trainings_initial_date].to_time, params[:trainings_final_date].to_time) if params[:trainings_initial_date].present? && params[:trainings_final_date].present?
    @employees
  end

  def to_s
    "#{name} (C.C. #{identification})"
  end
end
