module ApplicationHelper
  def is_are(count)
    count > 1 ? "are the top users" : "is the top user"
  end
end
