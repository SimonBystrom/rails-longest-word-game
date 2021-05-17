class GamesController < ApplicationController
  def new
    @letters = []
    alphabet = ('a'..'z').to_a
    10.times { @letters << alphabet.sample }
  end

  def score
    raise
  end
end
