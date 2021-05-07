class Project < ApplicationRecord
  include FieldsFormats

  has_many :activities, dependent: :delete_all

  validates :project_name, :start_date, :end_date, presence: true
end
