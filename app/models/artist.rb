class Artist < ActiveRecord::Base
    belongs_to :event
    has_many :tracks

    def update_tracks(client)
        track_map = [%w(sc_id id), %w(duration duration),
            %w(sc_permalink_uri permalink_url), %w(sc_streamable streamable),
            %w(sc_embeddable_by embeddable_by), %w(sc_genre genre),
            %w(sc_title title), %w(title title), %w(sc_artwork_url artwork_url),
            %w(sc_stream_url stream_url), %w(sc_favoritings_count favoritings_count)]
        tracks = client.get("/users/#{self.soundcloud_id}/tracks.json")
        tracks.each do |track|
            track_info = {artist: self}
            track_map.each do |dest, target|
                track_info[dest] = track[target]
            end
            track = Track.find_by(sc_id: track.id)
            track = Track.new if !track.present?
            track.update(track_info)
            track.save!
        end

    end
end
