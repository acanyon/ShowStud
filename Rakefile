# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

namespace :events do
    desc "Link events to soundcloud"
    task :link_soundcloud => :environment do
        client = SoundCloud.new(:client_id => '23db025bb77050582169820faaeb6bab')

        Artist.where(soundcloud_id: nil).all().each do |artist|
            puts "Entering info for Artist: '" + artist.name + "'"
            print "  Soundcloud uri: "
            #entered_uri = STDIN.gets.chomp
            entered_uri = 'https://soundcloud.com/diegos-umbrella'
            if entered_uri.present?
                tracks_info = client.get('/resolve.json', url: entered_uri)
                puts tracks_info
                if tracks_info['kind'] == 'user'
                    user_id = tracks_info['id']
                else
                    tracks_id = tracks_info['id']
                    user_id = tracks_info['user'].try(:[], 'id')
                end
                artist.soundcloud_id = user_id
                puts "user_id: #{user_id}"

                tracks = client.get("/users/#{user_id}/tracks.json")
                binding.pry
            else
                puts "skipped"
            end
            puts
        end
    end
end

namespace :tickets do
    desc "Load tickets from ticketfly"
    task :ticketfly => :environment do
	require 'open-uri'
	ticketfly_announced_link = 'http://www.ticketfly.com/api/events/justAnnounced.json?venueId='
	# ticket_id:id ticket_url:url date:datetime status:string price:string age:string headliner_name:string support_name:string facebook_event_id:string ticket_source:string venue_event_url:string
	remap_response = [
		%w(id ticket_id),
		%w(ticketPurchaseUrl ticket_url),
		%w(startDate date),
		%w(ticketPrice price),
		%w(headlinersName headliner_name),
		%w(supportsName support_name),
		%w(facebookEventId facebook_event_id),
		%w(urlEventDetailsUrl venue_event_url),
	]

	Venue.where(ticket_source: 'ticket fly').each do |venue|
		venue_json = JSON.load(open(ticketfly_announced_link + venue.ticketfly_venue_id.to_s))
		venue_json['events'].each do |event_data|
			data = {'ticket_source' => 'ticketfly', 'venue_id' => venue.id}
			remap_response.each do |source_key, dest_key|
				data[dest_key] = event_data[source_key]
			end

			if event_data['ageLimitCode'] == 'OVER_21'
				data['age'] = '21+'
			elsif event_data['ageLimitCode'] == 'OVER_18'
				data['age'] = '18+'
			end

			event = Event.where(ticket_id: event_data['id']).first || Event.new
			event.update_attributes(data)
			event.save!
		end
	end
    end
end

ShowStud::Application.load_tasks
