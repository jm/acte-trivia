require 'rubygems'
require 'sinatra'

set :sessions, true

get '/' do
  session[:questions] = YAML.load_file("questions.yml")
  session[:number_of_questions] = 10
  session[:questions_remaining] = 10
  session[:score] = 0
  
  erb :index
end

get '/ask' do
  if session[:questions_remaining] > 0
    question_number = rand(session[:questions].size)    
    question = session[:questions][question_number]
    session[:questions].delete_at(question_number)
  
    session[:question] = question  
    @question = question[0]
  
    session[:questions_remaining] -= 1
  
    erb :ask
  else
    redirect '/done'
  end
end

post '/answer' do
  if session[:question][1].include?(params[:answer].chomp.downcase)
    session[:score] += 1
    @correct = true
  else
    @correct = false 
  end
  
  erb :answer
end

get '/done' do
  erb :done
end