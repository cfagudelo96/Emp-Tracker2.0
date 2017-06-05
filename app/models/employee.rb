class Employee < ApplicationRecord
  FILTER_OPTIONS = [
      ['Nombre', 'name'],
      ['Identificación', 'identification'],
      ['Posición', 'position'],
      ['Área', 'area_id'],
      ['Compañía', 'company_id']
  ]

  has_many :attendances
  has_many :training_executions, through: :attendances

  belongs_to :area
  belongs_to :company

  self.per_page = 10

  validates :name, presence: true
  validates :identification, uniqueness: true, numericality: { greater_than: 0 }
  validates :admission_date, presence: true

  scope :by_name, (->(name) { where('name like ?', "%#{name}%") })
  scope :by_identification, (->(identification) { where identification: identification })
  scope :by_position, (->(position) { where('position like ?', "%#{position}%") })
  scope :area, (->(area_id) { where(area_id: area_id) })
  scope :company, (->(company_id) { where company_id: company_id })
  scope :active, (-> { where active: true })
  scope :by_admission_date, (->(initial_date, final_date) { where('admission_date > initial_date AND admission_date < final_date', initial_date, final_date) })

  def self.filter_employees(params)
    @employees = Employee.all
    @employees = @employees.by_name(params[:name]) if params[:name].present?
    @employees = @employees.by_identification(params[:identification]) if params[:identification].present?
    @employees = @employees.by_position(params[:position]) if params[:position].present?
    @employees = @employees.area(params[:area_id]) if params[:area_id].present?
    @employees = @employees.company(params[:company_id]) if params[:company_id].present?
    @employees = @employees.active if params[:active]
    @employees = @employees.by_admission_date if params[:initial_date].present? && params[:final_date].present?
    @employees
  end

  def to_s
    "#{name} (C.C. #{identification})"
  end
end
