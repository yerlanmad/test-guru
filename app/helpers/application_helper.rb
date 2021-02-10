module ApplicationHelper
  def current_year
    Time.current.year
  end

  def github_url(author, repo = nil)
    "https://github.com/#{author}/#{repo}"
  end

  def flash_message(key, message)
    type = (key == 'alert') ? 'alert-danger' : 'alert-warning'

    content_tag :div, message, class: "alert #{type}", role: "alert"
  end
end
