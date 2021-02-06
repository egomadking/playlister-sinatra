require_relative "./concerns/slugafiable"

class Genre < ActiveRecord::Base

  include Slugifiable::InstanceMethods
  extend Slugifiable::ClassMethods
  
  has_many  :song_genres
  has_many  :songs, through: :song_genres
  has_many  :artists, ->{ distinct }, through: :songs
end