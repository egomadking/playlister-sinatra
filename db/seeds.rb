# Add seed data here. Seed your database with `rake db:seed`

artists = [
  {:name =>"Tori Amos",
      :songs => [{:name => "Cornflake Girl", :genres => ["alt", "upbeat"]}, 
                {:name => "China", :genres => ["alt", "soft"]},
                {:name => "Precious Things", :genres => ["alt", "dramatic"]}]
  },
  {:name => "Massive Attack",
      :songs => [{:name => "Teardrop", :genres => ["downtempo"]},
                {:name => "Splitting the Atom", :genres => ["downtempo", "rap"]}]
  },
  {:name => "Megadeth",
      :songs => [{:name => "Sweating Bullets", :genres => ["rock", "heavy metal"]},
                {:name => "Tout le Monde", :genre => ["rock", "heavy metal", "power ballad"]}]
  },
  {:name => "Tool",
      :songs => [{:name => "Eulogy", :genre => ["rock", "alt"]},
                {:name => "Right in Two", :genre => ["rock", "alt"]}]
  }
]

artists.each do |a|
  artist = Artist.find_or_create_by(:name => a[:name])
  a[:songs].each do |s|
    song = Song.create(:name => s[:name])
    s[:genres].each do |g|
      genre = Genre.find_or_create_by(:name => g)
      song.genres << genre
    end
    artist.songs << song
  end
end
