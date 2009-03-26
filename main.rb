require 'rubygems'
require "yaml"

QuestionsInRound = 10


while true

  score = 0  
  questions = YAML.load_file("questions.yml")

  1.upto(QuestionsInRound) do |i|
    question_number = rand(questions.size)
    question = questions.delete_at(question_number) 
  
    puts question[0]
    answer1=gets
    if  question[1].include?(answer1.chomp.downcase)
      score += 1
      puts "correct"
    else 
      puts "incorrect"
    end
  end
  puts "You got #{score} of #{QuestionsInRound} correct in this round."
  puts "Would you like to play again? (Y/N)"
  play_again = gets.chomp.downcase
  break if play_again == "n"
end
puts "Thanks for Playing."