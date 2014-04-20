class AddTicketflyVenueIdToVenues < ActiveRecord::Migration
  def change
    add_column :venues, :ticketfly_venue_id, :integer
  end
end
