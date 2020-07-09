module GpaCalculator

  def calculate(grades)
    all_grades = []
  
    grades.each do |grade|
    if grade >= 90
      points = 4
    elsif grade >= 80
      points = 3
    elsif grade >= 70
      points = 2
    elsif grade >= 60
      points = 1
    elsif grade >=0
      points = 0
    else 
      points = 0
    end
      all_grades << points
    end
    if all_grades.length.zero?
      0
    else
    all_grades.sum / all_grades.length
    end
  end

end