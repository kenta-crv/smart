module AttendsHelper
  def time_view(seconds)
    d = Time.at(seconds)
    "#{d.day * 24 + d.hour}:#{d.min}:#{d.sec}"
  end

  def month_salary(seconds, h_salary)
    d = Time.at(seconds)
    (d.day*24 + d.hour) * h_salary
  end

end
