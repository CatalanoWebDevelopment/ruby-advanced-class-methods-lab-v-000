require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
    self
  end

  def self.create
    song = self.new
    song.save
  end

  def self.new_by_name(new_name)
    song = self.new
    song.name=(new_name)
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name=(name)
    song.save
  end

  def self.find_by_name(name)
    @@all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    # if self.find_by_name(name)
    #   find_by_name(name)
    # else
    #   self.create_by_name(name)
    # end

    find_by_name(name) || create_by_name(name)
  end

  def self.alphabetical
    @@all.sort_by{|song| song.name}
  end

  def self.destroy_all
    self.all.clear
  end

  def self.new_from_filename(string)
    string = string.split("-")
    binding.pry
    # string.each do |set|
    #   set = set.split
    #   string.artist_name = set[0]
    #   song.name = set[1]
    # end
  end

end
