class Track < ActiveRecord::Base
    belongs_to :artist

    before_save :update_genre
    before_save :update_active

    def self.genre_map 
        [
            [:independent, 'independent'],
            [:independent, 'alternative'],
            [:independent, 'folk'],
            [:independent, 'acoustic'],
            [:independent, 'psychedelic'],
            [:independent, 'funk'],
            [:independent, 'rock'],
            [:electronic, 'electronic'],
            [:electronic, 'drumbass'],
            [:electronic, 'drumnbass'],
            [:electronic, 'drumandbass'],
            [:electronic, 'techno'],
            [:electronic, 'dubstep'],
            [:electronic, 'trance'],
            [:electronic, 'trap'],
            [:electronic, 'synth'],
            [:electronic, 'dancing'],
            [:lounge, 'house'],
            [:lounge, 'lounge'],
            [:hiphoprap, 'hiphop'],
            [:electronic, 'electro'],
            [:hiphoprap, 'rap'],
            [:independent, 'indi'],
            [:electronic, 'dub'],
            [:pop, 'pop'],
            [:pop, 'dance'],
        ]
    end

    def self.genres
        self.genre_map.map{|k,v| k}.uniq
    end

    def update_genre
        genres = []
        Track.where(artist_id: self.artist_id).map do |track|
            genres << track.genre_list
        end
        genres = genres.flatten.compact.uniq.join(',')
    end
    
    def update_active
        if self.sc_streamable && self.sc_embeddable_by != 'none' && self.artist.event.date > Date.today
            self.active = true
        else 
            self.active = false
        end
    end

    def genre_list
        return if sc_genre.nil?
        sc_genre = self.sc_genre.downcase.strip.gsub(/[^\w]/, '')
        genres = self.class.genre_map.map do |target, match|
            target if sc_genre.match(match).present?
        end
        genres.compact.uniq
    end
end
