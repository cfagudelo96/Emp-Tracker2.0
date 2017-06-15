class Company < ApplicationRecord
  has_many :employees
  has_many :trainings
  has_many :training_executions

  validates :name, presence: true, uniqueness: true

  scope :by_name, (->(name) { where('name like ?', "%#{name}%") })

  def self.filter_companies(params)
    @companies = Company.all
    @companies = @companies.by_name(params[:name]) if params[:name].present?
    @companies
  end

  def to_s
    name
  end
end
