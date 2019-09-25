class Song < ActiveRecord::Base
  # add associations here
  has_many :notes
  belongs_to :artist
  belongs_to :genre

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.genre ? self.genre.name : nil
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  #notes is an array of strings?:
  def note_contents=(notes)
    notes.each do |nc|
      if nc != ""
        new_note = self.notes.build(content: nc)
        new_note.save
      end
    end
  end

  def note_contents
    all_content = self.notes.map {|n| n.content}
    #all_content.map {|c| c.delete if c == "" || c == nil}
  end
end
