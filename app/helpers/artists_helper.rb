module ArtistsHelper
    def artist_name=(a_name)
        if Artist.find_by(name: a_name)
            @song.artist=Artist.find_by(name: a_name)
        else
        artist=Artist.create(name: a_name)
        @song.artist=artist
        end
    end
    
      def artist_name(song)
        song.artist.name
      end
    
end
