class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :name
      t.string :genres
      t.string :ambiance
      t.integer :price
      t.string :neighborhood
      t.string :age
      t.string :ticket_source
      t.string :ticket_venue_url
      t.string :venue_url
      t.string :yelp_url

      t.timestamps
    end
  end
end
