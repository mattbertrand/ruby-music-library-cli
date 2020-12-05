class MusicImporter < Song

    attr_reader :path, :name, :artist, :genre, :song

    def initialize(path)
        @path = path
    end

    def files
        @files ||= Dir.glob("#{path}/*mp3").collect { |e| e.gsub("#{path}/","") }
    end

    def import
        files.each{ |f| Song.create_from_filename(f) }
    end
end