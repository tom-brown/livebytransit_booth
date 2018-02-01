class Search < ApplicationRecord
  # Direct associations

  has_many   :listings_searches,
             :dependent => :destroy

  has_many   :city_searches,
             :dependent => :destroy

  has_many   :hood_searches,
             :dependent => :destroy

  has_many   :metra_searches,
             :dependent => :destroy

  has_many   :cta_searches,
             :dependent => :destroy

  belongs_to :user

  # Indirect associations

  has_many   :neighborhoods,
             :through => :hood_searches,
             :source => :neighborhood

  has_many   :cities,
             :through => :city_searches,
             :source => :city

  has_many   :metra_stations,
             :through => :metra_searches,
             :source => :metra_station

  has_many   :cta_stations,
             :through => :cta_searches,
             :source => :cta_station

  has_many   :listings,
             :through => :listings_searches,
             :source => :listing

  # Validations

end
