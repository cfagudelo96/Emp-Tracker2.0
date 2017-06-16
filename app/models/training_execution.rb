class TrainingExecution < ApplicationRecord
  has_many :attendances
  has_many :employees, through: :attendances

  belongs_to :company

  validates :category, presence: true
  validates :topic, presence: true
  validates :date, presence: true
  validates :hourly_intensity, numericality: { greater_than_or_equal_to: 0 }
  validates :trainer, presence: true

  scope :by_category, (->(category) { where('category like ?', "%#{category}%") })
  scope :by_topic, (->(topic) { where('topic like ?', "%#{topic}%") })
  scope :by_date, (->(initial_date, final_date) { where(date: initial_date..final_date) })
  scope :by_area, (->(area_id) { where(area_id: area_id) })
  scope :by_collaborator, (->(collaborator) { where(collaborator_id: Employee.by_name(collaborator).select(:id)) })
  scope :by_company, (->(company_id) { where(company_id: company_id) })
  scope :planned, (-> { where(planned: true) })

  def self.filter_training_executions(params)
    @training_executions = TrainingExecution.all
    @training_executions = @training_executions.by_category(params[:category]) if params[:category].present?
    @training_executions = @training_executions.by_topic(params[:topic]) if params[:topic].present?
    @training_executions = @training_executions.by_date(params[:initial_date].to_time, params[:final_date].to_time) if params[:initial_date].present? && params[:final_date].present?
    @training_executions = @training_executions.by_area(params[:area_id]) if params[:area_id].present?
    @training_executions = @training_executions.by_collaborator(params[:collaborator]) if params[:collaborator].present?
    @training_executions = @training_executions.by_company(params[:company_id]) if params[:company_id].present?
    @training_executions = @training_executions.planned if params[:planned].present?
    @training_executions
  end

  def save_attendances(employees_id)
    attendances.destroy_all
    employees_id ||= []
    employees_id.each do |employee_id|
      attendances.create(employee: Employee.find(employee_id))
    end
  end

  def to_s
    topic
  end
end
