class Artist < ActiveRecord::Base
    belongs_to :event
    has_many :tracks
end
