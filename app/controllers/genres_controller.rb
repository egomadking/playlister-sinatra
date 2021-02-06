class GenresController < ApplicationController

  get '/genres' do
    @genres = all_genres
    erb :'genres/index'
  end

  get '/genres/:slug' do
    @genre = current_genre(params[:slug])
    erb :'genres/show'
  end

  helpers do
    def all_genres
      Genre.all
    end

    def current_genre(slug)
      Genre.find_by_slug(slug)
    end
  end
end