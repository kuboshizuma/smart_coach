module ApplicationHelper
  def chat_time(created_at)
    created_at.strftime('%m/%d %H:%M')
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
