class Activity < ApplicationRecord
  include FieldsFormats

  before_save :finished_default

  belongs_to :project

  validates :project_id, :activity_name, :start_date, :end_date, presence: true

  private

  def finished_default
    self.finished = false if self.finished.nil?
  end
end
