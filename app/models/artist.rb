require_relative "./concerns/slugafiable"

class Artist < ActiveRecord::Base

  include Slugifiable::InstanceMethods
  extend Slugifiable::ClassMethods

  has_many :songs
  has_many :genres, ->{ distinct }, through: :songs

end