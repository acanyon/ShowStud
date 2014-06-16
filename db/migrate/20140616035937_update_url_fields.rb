class UpdateUrlFields < ActiveRecord::Migration
    def up

            change_column :events, :ticket_url, :text
            change_column :events, :venue_event_url, :text
            change_column :tracks, :sc_artwork_url, :text
            change_column :tracks, :sc_stream_url, :text
            change_column :tracks, :sc_permalink_uri, :text
            change_column :venues, :ticket_venue_url, :text
            change_column :venues, :venue_url, :text
            change_column :venues, :yelp_url, :text

            change_column :tracks, :title, :text
            change_column :tracks, :sc_title, :text

            drop_table :active_admin_comments
            
    end

    def down
            change_column :events, :ticket_url, :string
            change_column :events, :venue_event_url, :string
            change_column :tracks, :sc_artwork_url, :string
            change_column :tracks, :sc_stream_url, :string
            change_column :tracks, :sc_permalink_uri, :string
            change_column :venues, :ticket_venue_url, :string
            change_column :venues, :venue_url, :string
            change_column :venues, :yelp_url, :string
            
            change_column :tracks, :title, :string
            change_column :tracks, :sc_title, :string
    end
end
