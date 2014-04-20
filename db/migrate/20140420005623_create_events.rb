class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :ticket_id
      t.string :ticket_url
      t.datetime :date
      t.string :status
      t.string :price
      t.string :age
      t.string :headliner_name
      t.string :support_name
      t.string :facebook_event_id
      t.string :ticket_source
      t.string :venue_event_url

      t.timestamps
    end
  end
end
