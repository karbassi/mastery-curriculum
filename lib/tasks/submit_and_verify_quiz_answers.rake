require_relative "../api"

desc "Send your answers for a quiz so they can be verified as correct"
task :submit_and_verify_quiz_answers do
  if (ARGV.length == 1)
    puts "Usage: submit_and_verify_quiz_answers [github_username] [chapter_number] [quiz_number]\n" \
    "Example: submit_and_verify_quiz_answers oleg 4 1\n"
    exit
  end

  puts Api.submit_and_verify_quiz_answers(
         StudentQuiz.new(github_username: ARGV[1],
                         chapter_number: ARGV[2],
                         quiz_number: ARGV[3]))
  exit
end
