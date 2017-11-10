require "uri"
require "net/http"

module Api
  API_SERVER_HOST = "http://67.205.138.167/"

  def self.get_quiz(student_quiz)
    get_request(API_SERVER_HOST,
                "/get_quiz",
                { github_username: student_quiz.github_username,
                  chapter_number: student_quiz.chapter_number,
                  quiz_number: student_quiz.quiz_number })
  end

  def self.submit_and_verify_quiz_answers(student_quiz)
    get_request(API_SERVER_HOST,
                "/mark_quiz",
                { github_username: student_quiz.github_username,
                  chapter_number: student_quiz.chapter_number,
                  quiz_number: student_quiz.quiz_number })
  end

  private

  def self.get_request(server, path, params)
    uri = URI.join(server, path)
    uri.query = URI.encode_www_form(params)
    Net::HTTP.get(uri)
  end
end
