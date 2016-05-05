module ItemsHelper
  def timeRemaining(created_at)
    if created_at > Time.now.to_date - 4.days
      "success"
    elsif created_at < Time.now.to_date - 6.days
      "danger"
    else
      "warning"
    end
  end
end
