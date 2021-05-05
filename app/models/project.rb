class Project < ApplicationRecord
  has_many :activities

  validates :project_name, :start_date, :end_date, presence: true
end
