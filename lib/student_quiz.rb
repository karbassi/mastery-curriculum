class StudentQuiz
  attr_reader :github_username, :chapter_number, :quiz_number

  def initialize(github_username:, chapter_number:, quiz_number:)
    @github_username = github_username
    @chapter_number = chapter_number
    @quiz_number = quiz_number
  end
end
