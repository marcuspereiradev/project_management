module FieldsFormats
  extend ActiveSupport::Concern

  def start_date_formated
    self.start_date.strftime("%d/%m/%Y")
  end

  def end_date_formated
    self.end_date.strftime("%d/%m/%Y")
  end

  def created_at_formated
    self.created_at.strftime("%d/%m/%Y")
  end
end
