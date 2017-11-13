require "student_quiz"

describe StudentQuiz do
  describe "::new" do
    describe "data availability" do
      subject { StudentQuiz.new(github_username: "maryrosecook",
                                chapter_number: "2",
                                quiz_number: "1") }

      it "exposes github_username" do
        expect(subject.github_username).to eq("maryrosecook")
      end

      it "exposes chapter_number" do
        expect(subject.chapter_number).to eq("2")
      end

      it "exposes quiz_number" do
        expect(subject.quiz_number).to eq("1")
      end
    end
  end
end
