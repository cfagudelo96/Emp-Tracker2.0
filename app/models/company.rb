class Company < ApplicationRecord
  self.per_page = 10

  validates :name, presence: true, uniqueness: true

  def to_s
    name
  end
end
