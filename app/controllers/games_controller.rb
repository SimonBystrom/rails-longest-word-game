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
    @word = params[:word].split('')

    url = "https://wagon-dictionary.herokuapp.com/#{params[:word]}"
    @is_word = JSON.parse(URI.open(url).read)["found"]



    if @is_word
      @check = @word.all? do |letter|
        @current_letters.include?(letter)
        @current_letters.count(letter) >= @word.count(letter)
      end
      @check ? @msg = "#{params[:word]} was a great guess!" : @msg = "Not in the grid"
    elsif !@is_word
      @msg = "Not a word"
    end

      # check ? @msg = "#{params[:word]} was a great guess!" : @msg = "#{params[:word]} is not included in the letters!"

    #   elsif is_word?
    #       params[:word]
    #   else
    #     "not a word"
    #   end
    # }
    p @msg
  end
end
