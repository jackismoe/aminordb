class Song < ActiveRecord::Base
    validates_presence_of   :name,
                            :artist

    belongs_to              :user
end
