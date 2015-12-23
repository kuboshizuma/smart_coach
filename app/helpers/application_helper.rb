module ApplicationHelper
  def chat_time(created_at)
    created_at.strftime('%m/%d %H:%M')
  end

  def lesson_start_time(start_day)
    start_day.strftime('%Y.%m.%d') if start_day.present?
  end

  def lesson_finish_time(start_day, month)
    (start_day + month.month).strftime('%Y.%m.%d') if start_day.present? && month.present?
  end

  def lesson_apply_limit(start_day, month)
    (start_day + (month - 1).month).strftime('%Y.%m.%d') if start_day.present? && month.present?
  end


  def flash_class_for(flash_type)
    case flash_type
    when 'success' then 'alert-success'
    when 'error'   then 'alert-danger'
    when 'alert'   then 'alert-warning'
    when 'notice'  then 'alert-info'
    end
  end
end
