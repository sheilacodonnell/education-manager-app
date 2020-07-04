module ApplicationHelper

  def class_period_formatted(subject)
    subject.class_period.ordinalize + ' period'
  end

  def basic_date(item)
    # 07/04/2020
    item.strftime("%m/%d/%Y")
  end
end
