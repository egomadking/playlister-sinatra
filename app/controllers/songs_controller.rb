require 'rack-flash'

class SongsController < ApplicationController
  use Rack::Flash

  get '/songs' do
    @songs = all_songs
    erb :'songs/index'
  end

  post '/songs' do
    #binding.pry
    song = Song.create(:name => params[:song][:name])
    song.artist = Artist.find_or_create_by(:name => params[:artist][:name])
    params[:genres].each do |g|
      song.genres << Genre.find(g)
    end
    song.save
    flash[:message] = "Successfully created song."
    redirect("/songs/#{song.slug}")
  end
  
  get '/songs/new' do
    @artists = Artist.all
    @genres = Genre.all
    erb :'songs/new'
  end

  get '/songs/:slug' do
    @song = current_song(params[:slug])
    erb :'songs/show'
  end

  patch '/songs/:slug' do
    @song = current_song(params[:slug])
    @song.update(:name => params[:song][:name])
    @song.artist = Artist.find_or_create_by(:name => params[:artist][:name])
    @song.genres.clear
    #binding.pry
    params[:genres].each do |g|
      @song.genres << Genre.find(g)
    end
    @song.save
    flash[:message] = "Successfully updated song."
    redirect("/songs/#{@song.slug}")
  end

  get '/songs/:slug/edit' do
    @song = current_song(params[:slug])
    @artists = Artist.all
    @genres = Genre.all
    erb :'songs/edit'
  end

  helpers do
    def all_songs
      Song.all
    end

    def current_song(slug)
      Song.find_by_slug(slug)
    end
  end
end