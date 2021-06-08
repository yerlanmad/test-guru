class GistQuestionService
  def initialize(question, client: nil)
    @question = question
    @test = question.test
    @client = client || Octokit::Client.new(:access_token => ENV.fetch('GITHUB_TOKEN'))
  end

  def call
    @client.create_gist(gist_params)
    @client.last_response if @client.last_response.data.id
  end

  private

  def gist_params
    {
      description: I18n.t('gist_question_service.description', test_title: @test.title),
      files: {
        'test-guru-question.txt' => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    [
      @question.body,
      @question.answers.pluck(:body)
    ].join("\n")
  end
end