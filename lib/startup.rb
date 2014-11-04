require 'sinatra'
require "sinatra/reloader"
require "colorize"
set :bind, '0.0.0.0'

def find_largest_number(list_of_numbers)
  numbers = list_of_numbers.split(', ').map{ |number| number.to_i }
  numbers.max.to_s
end

get '/' do
  query = params[:q].split(': ')
  question = query[1]
  if question == 'what is your name'
    'Evolve'
  elsif question == "which of the following numbers is the largest"
    find_largest_number(query[2])
  elsif (question.include? 'plus')
    words = question.split(' ')
    (words[2].to_i + words[4].to_i).to_s
  elsif (question.include? 'multiplied')
    words = question.split(' ')
    (words[2].to_i * words[5].to_i).to_s
  elsif question == "which of the following animals is green is th most popular"
    "frog"
  elsif question == "which city is the Eiffel tower in"
    "Paris"
  elsif question == "what currency did Spain use before the Euro"
    "Peseta"
  elsif question == "what colour is a banana"
    "yellow"
  else
    puts question.red
  end
  
end