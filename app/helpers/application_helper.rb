module ApplicationHelper
  FLASH_MESSAGE = { alert: 'Are you a Guru? Verify your Email and Password please.' }.freeze

  def current_year
    Time.current.year
  end

  def github_url(author, repo = nil)
    "https://github.com/#{author}/#{repo}"
  end

  def flash_message(type)
    FLASH_MESSAGE[type]
  end
end
