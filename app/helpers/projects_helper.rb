module ProjectsHelper
  def how_many_percent
    @project.activities.exists? ? "#{((@project.activities.where(finished: "true").count.to_f / @project.activities.count) * 100).to_i}%" : "0%"
  end

  def delayed?
    @project.activities.exists? && @project.activities.order(end_date: :desc).first.end_date_formated > @project.end_date_formated ? "Sim" : "Não"
  end
end
