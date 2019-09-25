require "pry"

class Song < ActiveRecord::Base
  belongs_to :artist  
  belongs_to :genre
  has_many :notes
  
  
  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def genre_id=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.genre ? self.genre.name : nil
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.genre ? self.genre.name : nil
  end

  def notes_1=(note)
    self.notes << Note.new(content: note)
  end

  def notes_1
    self.notes[0]
  end

  def notes_2=(note)
    self.notes << Note.new(content: note)
  end

  def notes_2
    self.notes[1]
  end

  def notes_3=(note)
    self.notes << Note.new(content: note)
  end

  def notes_3
    self.notes[2]
  end

  def notes_4=(note)
    self.notes << Note.new(content: note)
  end

  def notes_4
    self.notes[3]
  end

  def note_contents
    self.notes.map do |note|
      note.content unless note.content.length <= 0
    end.compact
  end

  def note_contents=(contents)
    contents.each do |content|
      self.notes << Note.new(content: content.strip)
    end
  end

end
