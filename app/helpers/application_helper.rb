module ApplicationHelper
  def chat_time(created_at)
    created_at.strftime('%m/%d %H:%M')
  end
end
