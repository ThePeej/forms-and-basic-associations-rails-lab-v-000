class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(artist)
    self.artist = Artist.find_or_create_by(name: artist)
  end

  def artist_name
    self.artist.name
  end

  def genre_ids=(ids)
    ids.each do |id|
      self.genres << Genre.find(id)
    end
  end
  
end
