class Company < ApplicationRecord
  self.per_page = 10

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
