class UpdateEventColumns < ActiveRecord::Migration
    def up
        change_column :events, :headliner_name, :text
        change_column :events, :support_name, :text
        change_column :artists, :name, :text
    end
    def down
        # This might cause trouble if you have strings longer
        # than 255 characters.
        change_column :events, :headliner_name, :string
        change_column :events, :support_name, :string
        change_column :artists, :name, :string
    end
end
