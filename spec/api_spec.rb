require "api"

describe Api do
  let :student_quiz { double(:student_quiz,
                             github_username: "maryrosecook",
                             chapter_number: "2",
                             quiz_number: "1") }

  describe "#get_quiz" do
    before(:each) do
      stub_request(:get, /mastery_api.maryrosecook.com\/get_quiz/)
        .with(query: { chapter_number: student_quiz.chapter_number,
                       github_username: student_quiz.github_username,
                       quiz_number: student_quiz.quiz_number })
        .to_return(status: 200, body: "get quiz response", headers: {})
    end

    it "sends get_quiz request with quiz and student data, returns response" do
      expect(Api.get_quiz(student_quiz)).to eq("get quiz response")
    end
  end

  describe "#submit_and_verify_quiz_answers" do
    before(:each) do
      stub_request(:get, /mastery_api.maryrosecook.com\/mark_quiz/)
        .with(query: { chapter_number: student_quiz.chapter_number,
                       github_username: student_quiz.github_username,
                       quiz_number: student_quiz.quiz_number })
        .to_return(status: 200, body: "submit quiz response", headers: {})
    end

    it "sends submit quiz request with quiz and student data, returns response" do
      expect(Api.submit_and_verify_quiz_answers(student_quiz))
        .to eq("submit quiz response")
    end
  end
end
