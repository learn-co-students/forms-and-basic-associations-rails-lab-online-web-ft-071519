class Song < ActiveRecord::Base
  # add associations here
  has_many :notes
  belongs_to :artist
  belongs_to :genre

  def genre_id=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end 

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end 
  
  def genre_name
    self.genre ? self.genre.name : nil
  end

  def artist_name=(name)
    artist = Artist.find_or_create_by(name: name)
    self.artist = artist
  end 

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def note_contents
    self.notes.map(&:content)
  end 

  def note_contents=(notes)
    notes.each do |note|
      if !note.empty?
        self.notes.build(content: note)
      end
    end
  end 
end
