module ApplicationHelper

  def format_date(t)
    t.try(:strftime, '%d/%m/%Y')
  end

  def format_time(t)
    t.try(:strftime, '%H:%M')
  end

end
