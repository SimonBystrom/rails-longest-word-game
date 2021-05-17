require 'json'
require 'open-uri'

class GamesController < ApplicationController
  def new
    @letters = []
    alphabet = ('a'..'z').to_a
    10.times { @letters << alphabet.sample }
  end

  def score
    # write logic for game
    # 1 get the  current letters from the letters arr
    @current_letters = params[:current_letters].split(' ')
    @word = params[:word].downcase.split('')

    url = "https://wagon-dictionary.herokuapp.com/#{params[:word]}"
    opened_url = URI.open(url).read
    @is_word = JSON.parse(opened_url)['found']

    @msg =
      if @is_word
        @check = @word.all? do |letter|
          @current_letters.include?(letter)
          @current_letters.count(letter) >= @word.count(letter)
        end
        @check ? "#{params[:word].upcase} was a great guess!" : "#{params[:word].upcase} cant be built with #{params[:current_letters]}"
      else
        "#{params[:word].upcase} is not a word"
      end
  end
end
