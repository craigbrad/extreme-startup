require 'sinatra'
require "sinatra/reloader"
require "colorize"
require 'prime'
require './lib/banana'
require './lib/spainish_currency'
set :bind, '0.0.0.0'

def find_largest_number(list_of_numbers)
  numbers = list_of_numbers.split(', ').map{ |number| number.to_i }
  numbers.max.to_s
end

def fibonacci(n)
   n <= 1 ? n :  fibonacci( n - 1 ) + fibonacci( n - 2 ) 
end

get '/' do
  query = params[:q].split(': ')
  question = query[1]

  answers = [
    Banana.new(question),
    SpanishCurrency.new(question),
  ]

  answers = answers.keep_if { |answer| answer.question_check }
  if !answers.empty?
    return answers.first.answer
  end

  if question == 'what is your name'
    'Evolve'
  elsif question == "which of the following numbers is the largest"
    find_largest_number(query[2])
  elsif (question.include? 'plus')
    words = question.split(' ')
    (words[2].to_i + words[4].to_i).to_s
  elsif (question.include? 'power')
    words = question.split(' ')
    (words[2].to_i ** words[7].to_i).to_s
  elsif (question.include? 'multiplied')
    words = question.split(' ')
    (words[2].to_i * words[5].to_i).to_s
  elsif question == "which of the following animals is green is th most popular"
    "frog"
  elsif question == "which city is the Eiffel tower in"
    "Paris"

  elsif question == "which of the following numbers are primes"
    numbers = query[2].split(', ').map{ |number| number.to_i }
    prime_numbers = ""
    numbers.each do |number| 
      prime_numbers << number.to_s << ", " if Prime.prime?(number)
    end
    prime_numbers.to_s.chomp(", ")

  elsif question.include?("Fibonacci sequence")
    words = question.split(' ')
    number = words[3].chop.chop.to_i
    fibonacci(number).to_s
  else
    puts question.red
  end
end
