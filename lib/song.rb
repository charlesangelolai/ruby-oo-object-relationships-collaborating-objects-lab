require 'pry'

class Song
    attr_accessor :name, :artist

    @@all = []

    def initialize(name)
        self.name = name
        save
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end

    def self.new_by_filename(filename)
        filename = filename.split(" - ")
        song = self.new(filename[1])
        song.artist = Artist.new(filename[0])
        song
    end

    def artist_name=(name)
        self.artist = Artist.find_or_create_by_name(name)
    end
end