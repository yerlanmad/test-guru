module GistsHelper
  def question_link(question)
    link_to question.body[0..24], admin_question_path(question)
  end

  def gist_external_link(gist_id)
    link_to gist_id, "#{ENV['GIST_URL']}/#{gist_id}", target: '_blank'
  end
end
