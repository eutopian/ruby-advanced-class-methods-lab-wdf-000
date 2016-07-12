class Song
  attr_accessor :name, :artist_name
  @@all = []
  @@allsort = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name(name)
    @@all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    song = self.new
    song.name = name
    if find_by_name(name) != nil
      return song
    else create_by_name(name)
    end
  end

  def self.alphabetical
    sorted = []
    sorted = self.all.sort_by {|song| song.name} 
    sorted
  end

  def self.new_from_filename(name)
    song = self.new
    split_name = name.split(/ - /)
    split_name_period = split_name[1].split(/\./)
    song.name = split_name_period[0]
    song.artist_name = split_name[0]
    song
  end

  def self.create_from_filename(name)
    song = self.new
    song_new = new_from_filename(name)
    @@all << song_new
    song
  end

  def self.destroy_all
    self.all.clear
  end

end
