class Event < ActiveRecord::Base
    has_many :artists

    def generate_artists()
        Artist.create(event: self, name: self.headliner_name) if self.headliner_name
        Artist.create(event: self, name: self.support_name) if self.support_name
    end
end
