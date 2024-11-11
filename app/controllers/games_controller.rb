require "open-uri"

class GamesController < ApplicationController

  def new
    @letter = []
    letters = ("a".."z")
    10.times do |nb|
      @letter << letters.to_a.sample
    end
  end

  def score
    @response = ''
    @responses = params[:response]
    @letter = params["user_reponse"]
    url = "https://dictionary.lewagon.com/#{@responses}"
    userr = URI.parse(url).read
    user = JSON.parse(userr)
    if user['found'] == false
      @response = "Votre mot n'existe pas"
    else
      user['word'].split('').each do |let|
        if @letter.include? let
          @response = 'Bien joué ton mot est bon'
        else
          @response = "Ton mot n'est pas bon dommage!"
          break
        end
      end
    end
  end
end
