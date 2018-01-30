class MetraLine < ApplicationRecord
  # Direct associations

  has_many   :metra_assigns,
             :dependent => :destroy

  # Indirect associations

  has_many   :metra_stations,
             :through => :metra_assigns,
             :source => :metra_station

  # Validations

end
