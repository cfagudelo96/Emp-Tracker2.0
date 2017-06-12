class Area < ApplicationRecord
  self.per_page = 10

  has_many :employees
  has_many :trainings
  has_many :training_executions

  validates :name, presence: true, uniqueness: true

  scope :by_name, (->(name) { where('name like ?', "%#{name}%") })

  def self.filter_areas(params)
    @areas = Area.all
    @areas = @areas.by_name(params[:name]) if params[:name].present?
    @areas
  end

  def to_s
    name
  end
end
