class ArtistsController < ApplicationController

  get '/artists' do
    @artists = all_artists
    erb :'artists/index'
  end

  get '/artists/:slug' do
    @artist = current_artist(params[:slug])
    erb :'/artists/show'
  end

  helpers do

    def current_artist(slug)
      Artist.find_by_slug(slug)
    end

    def all_artists
      Artist.all
    end
  end
end
